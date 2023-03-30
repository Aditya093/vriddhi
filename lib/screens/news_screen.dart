import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class NewsScreen extends StatefulWidget
{
  static final String id = 'news_screen';

  const NewsScreen({super.key});
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String _apiKey = 'b58787888cbf40c8a97dc2aad6fe1023';
  final String _baseUrl =
      'https://newsapi.org/v2/everything?q=farming&apiKey=b58787888cbf40c8a97dc2aad6fe1023';

  late List<dynamic> _articles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() async {
    final response = await http.get(Uri.parse('$_baseUrl&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _articles = data['articles'];
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar("News"),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                final article = _articles[index];
                return Card(
                    child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: article['urlToImage'] != null
                          ? Image.network(
                              article['urlToImage'],
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset("assets/images/temp/Get_started.png",),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            article['title'],
                            style: kFormTextFieldLabelStyle.copyWith(
                                fontSize: 12.0),
                          ),

                          SizedBox(height: 15.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "12/01/0001",
                                style: kFormSecondaryHeadingStyle.copyWith(
                                    fontSize: 12.0),
                              ),
                              Text("abc news agency",
                                style: kFormSecondaryHeadingStyle.copyWith(
                                    fontSize: 12.0),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
                // return ListTile(
                //   leading: article['urlToImage'] != null ? Image.network(article['urlToImage'], fit: BoxFit.cover, height: 200,) : Image.asset("assets/images/temp/Get_started.png", fit: BoxFit.cover, height: 200),
                //   title: Text(article['title']),
                //   subtitle: Column(
                //     children: [
                //       SizedBox(height: 30.0,),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //         Text("12/01/0001", style: kFormTextFieldLabelStyle.copyWith(fontSize: 16.0),),
                //         Text("abc news agency")
                //       ],),
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}
