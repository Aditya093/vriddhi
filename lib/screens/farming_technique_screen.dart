import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class FarmingTechniquesScreen extends StatefulWidget {
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

  void playVideo(String videoUrl) {
    // Add code to play the video
    print('Playing video: $videoUrl');
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
          String description =
              item["farming_technique"]["description"];
          List<dynamic> adv =
              item["farming_technique"]["advantages"];
          String advantages =
              adv.map((item) => '${adv.indexOf(item) + 1}. $item').join('\n');
          List<dynamic> disadv =
              item["farming_technique"]["advantages"];
          String disadvantages= disadv
              .map((item) => '${disadv.indexOf(item) + 1}. $item')
              .join('\n');
          // String videoLink = item["farming_technique"]["learning_video"]["video_link"];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(name),
                  subtitle: Text(description),
                ),
                // Image.asset("assets/images/categories/category_Cereals.png"),
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {

                      },
                      child: Text('Play'),
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Column(
                                children: [
                                  Text("Advantages: \n" + advantages),
                                  Text("Disadvantages: \n" + disadvantages),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Text('Know More'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
