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
      final diseaseData = data[toDiseaseCase(widget.diseaseName)];
      // final diseaseScientificName = data[toDiseaseCase(widget.diseaseName)][3];
      // print(diseaseScientificName);
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
                      "assets/images/plant_diseases/${toDiseaseCase(widget.diseaseName)}.JPG", height: 150, width: 150,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // {"Disease Scienctific Name": }
            ],
          ),
        ),
      ),
    );
  }
}
