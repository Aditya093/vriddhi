import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:change_case/change_case.dart';

class DiseaseDetailsScreen extends StatefulWidget {
  static const String id = 'crop_details_screen';

  DiseaseDetailsScreen({required this.diseaseName});
  final String diseaseName;

  @override
  State<DiseaseDetailsScreen> createState() => _DiseaseDetailsScreenState();
}

class _DiseaseDetailsScreenState extends State<DiseaseDetailsScreen> {
  //variables

  String toDiseaseCase(String input) {
    List<String> words = input.split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] = "${words[i][0].toUpperCase()}${words[i].substring(1)}";
    }
    return words.join('_');
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/disease_guide.json');
    final data = await jsonDecode(response) ;
    setState(()  {
      // final diseaseData = data[toDiseaseCase(widget.diseaseName)];
      final dynamic diseaseScientificName = data[toDiseaseCase(widget.diseaseName)][3];
      print(diseaseScientificName);
      print("success 1");
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
    print("success 2");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Center(
                  child: Text(
                    widget.diseaseName.toCapitalCase(),
                    style: kWeekTitleTS,
                  ),
                ),
              ),
              Center(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/plant_diseases/${toDiseaseCase(widget.diseaseName)}.JPG",
                    height: 200,
                    width: 200,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // Icon(FontAwesomeIcons.minus, size: 30.0,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Scientific Name : ",
                                style: kFormTextFieldLabelStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("Diplocarpon earliana",
                                  style: kFormTextFieldLabelStyle.copyWith(
                                      fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Symptoms :  ",
                                style: kFormTextFieldLabelStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  "1.Small, purple-red spots on the upper surface of leaves\n2.Spots may turn brown and develop a yellow halo\n3.Leaves may become distorted and curl upwards\n4.Infected leaves may drop prematurely, leading to reduced plant vigor\n5.Fruit quality and yield may be reduced",
                                  style: kFormTextFieldLabelStyle.copyWith(
                                      fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Causes : ",
                                style: kFormTextFieldLabelStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  "1.Fungal infection by Diplocarpon earliana\n2.Favored by warm, humid conditions\n3.Spread by wind and splashing water",
                                  style: kFormTextFieldLabelStyle.copyWith(
                                      fontSize: 18)),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Treatments :  ",
                                style: kFormTextFieldLabelStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  "1.Apply fungicides preventively, starting at the onset of disease or when conditions favor disease development\n2.Ensure proper air circulation and reduce humidity by avoiding overhead irrigation and providing adequate plant spacing\n3.Remove and destroy infected plant debris\nRemove and destroy infected plant debris",
                                   style: kFormTextFieldLabelStyle.copyWith(
                                  fontSize: 18)),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Prevention : ",
                                style: kFormTextFieldLabelStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  "1.Plant resistant strawberry varieties\n2.Ensure proper air circulation and reduce humidity\n3.Avoid overhead irrigation\n4.Rotate crops to reduce disease pressure\n5.Apply preventative fungicides",
                                  style: kFormTextFieldLabelStyle.copyWith(
                                      fontSize: 18)),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      )
                    ],
                  )),
              // {"Disease Scienctific Name": }
            ],
          ),
        ),
      ),
    );
  }
}
