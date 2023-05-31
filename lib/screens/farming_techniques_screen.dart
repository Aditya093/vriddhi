import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class FarmingTechniquesScreen extends StatefulWidget {
  static const String id = 'farming_techniques_screen';

  @override
  State<FarmingTechniquesScreen> createState() =>
      _FarmingTechniquesScreenState();
}

class _FarmingTechniquesScreenState extends State<FarmingTechniquesScreen> {

  Map<String, dynamic> techniqueData = {};
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String jsonData =
    await rootBundle.loadString('assets/farming_technique.json');
    final data = await jsonDecode(jsonData);
    setState(() {
      this.techniqueData = data;
    }
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar("Farming Techniques"),
      body: ListView.builder(
        itemCount: techniqueData.length,
        itemBuilder: (context, index) {
          final key = techniqueData.keys.elementAt(index);
          final item = techniqueData[key];
          String name = item["farming_technique"]["name"];
          String description = item["farming_technique"]["description"];
          List<dynamic> adv = item["farming_technique"]["advantages"];
          String advantages = adv.map((item) => '${adv.indexOf(item) + 1}. $item').join('\n');
          List<dynamic> disadv = item["farming_technique"]["advantages"];
          String disadvantages= disadv.map((item) => '${disadv.indexOf(item) + 1}. $item').join('\n');
          Map<String, dynamic> learningVideo = item["learning_video"];
          String videoURL = learningVideo["video_link"];
          return Card(
            color: Color(0xFFCCDBDC),
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(name, style: kFormTextFieldLabelStyle,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoURL,
                        flags: YoutubePlayerFlags(autoPlay: false),
                      ),
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                color: Color(0xff757575),
                                child: Container(
                                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF8F8F6),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.minus,
                                        size: 30.0,
                                      ),
                                      Text("Description: ", style: kFormTextFieldLabelStyle,),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(description),
                                      ),
                                      Text("Advantages: ", style: kFormTextFieldLabelStyle,),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(advantages),
                                      ),
                                      Text("Disadvantages: ", style: kFormTextFieldLabelStyle,),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(disadvantages),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text('Know More', style: TextStyle(fontSize: 16.0),),
                      ),
                      Icon(FontAwesomeIcons.angleRight, size: 16.0, color: Colors.blue,),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

