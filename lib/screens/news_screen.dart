import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/location_data.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class NewsService {

  final String newsCatcherApiKey =
      '2LXqpD_wnG-veRZoSB-cBqe2Jabbqp7GMQmJca83kKo';

  Future<List<dynamic>> getAgricultureNews(String location) async {
    // final String newsUrl = 'https://newsapi.org/v2/everything?q=agriculture farming farmer crop -game&apiKey=$newsApiKey';
    final String newsCatcherUrl =
        'https://api.newscatcherapi.com/v2/search?q=agriculture farm farming farmer crop -game&lang=en';

    try {
      final response = await http.get(Uri.parse(newsCatcherUrl),
          headers: {'x-api-key': newsCatcherApiKey});
      print(response);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final articles = jsonData['articles'];
        return articles;
      } else {
        throw Exception('Failed to connect to the News API');
      }
    } catch (e) {
      throw Exception('Failed to connect to the APIs');
    }
  }
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  List<dynamic> _newsData = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      final locationData = Provider.of<LocationData>(context);
      final news = await _newsService.getAgricultureNews('Sarkhej');
      setState(() {
        _newsData = news;
      });
    } catch (e) {
      print('Error fetching news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar("News"),
      body: FutureBuilder<List<dynamic>>(
        future: _newsService.getAgricultureNews('Sarkhej'),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(
                          article: article,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          article['media'],
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                article['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kButtonPositiveColor,
                                ),
                              ),
                              SizedBox(height: 12.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    article['author'],
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  Text(
                                    article['clean_url'],
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                            ],
                          ),
                        ),
                        Container(height: 5),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load news'));
          } else {
            print(snapshot);
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key, required this.article,});
  final article;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool isSpeaking = false;

  FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(2);
  }

  Future<void> _stopSpeaking() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ReusableWidgets.smallAppBar("news"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.0,
                      color: kButtonPositiveColor,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    widget.article["clean_url"],
                    style:
                        TextStyle(fontSize: 20.0, color: kButtonPositiveColor),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.volume_down_rounded,
                      size: 30.0,
                      color: kButtonPositiveColor,
                    ),
                    onPressed: (){
                      setState(() {
                        isSpeaking = !isSpeaking;
                      });
                      isSpeaking ? _speak("Title: "+ widget.article["title"]+"."+ widget.article['summary']) : _stopSpeaking();
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                widget.article['title'],
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: kButtonPositiveColor),
              ),
              SizedBox(height: 30.0),
              Image.network(
                widget.article['media'],
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.article["author"],
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text(
                    widget.article["published_date"].substring(0, 10),
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                widget.article['summary'],
                style: TextStyle(fontSize: 20.0, color: kButtonPositiveColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}