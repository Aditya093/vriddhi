import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class NewsScreen extends StatefulWidget {

  const NewsScreen({super.key});
  @override
  _NewsScreenState createState() => _NewsScreenState();
}
class NewsService{
  final String newsApiKey = 'b58787888cbf40c8a97dc2aad6fe1023';
  Future<List<dynamic>> getAgricultureNews() async {
    final String newsUrl =
        'https://newsapi.org/v2/everything?q=agriculture farming farmer crop -game&apiKey=$newsApiKey';
      final response = await http.get(
        Uri.parse(newsUrl),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final articles = jsonData['articles'];
          return [...articles];
        }
      else {
          throw Exception('Failed to fetch news from NewsCatcher API');
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
      final news = await _newsService.getAgricultureNews();
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
      appBar: AppBar(
        title: Text('Agri News'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsService.getAgricultureNews(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  leading: article['urlToImage'] != null
                      ? Image.network(
                    article['urlToImage'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                      : Container(),
                  title: Text(article['title']),
                  subtitle: Text(article['description']),
                  onTap: () {
                    launchURL(article['url']);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load news'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}