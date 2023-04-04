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
  String disScName = "";
  String disSymptoms = "";
  String disCauses = "";
  String disTreatment = "";
  String disPrevention = "";

  String toDiseaseCase(String input) {
    List<String> words = input.split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] = "${words[i][0].toUpperCase()}${words[i].substring(1)}";
    }
    return words.join('_');
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/disease_guide.json');
    final data = await jsonDecode(response);
    setState(() {
      final diseaseScientificName =
          data[toDiseaseCase(widget.diseaseName)]["scientific_name"];
      this.disScName = diseaseScientificName;
      final disSymptoms = data[toDiseaseCase(widget.diseaseName)]["symptoms"];
      this.disSymptoms  = disSymptoms
          .map((item) => '${disSymptoms.indexOf(item) + 1}. $item')
          .join('\n');
      final disCauses = data[toDiseaseCase(widget.diseaseName)]["causes"];
      this.disCauses  = disCauses
          .map((item) => '${disCauses.indexOf(item) + 1}. $item')
          .join('\n');
      final disTreatments =
          data[toDiseaseCase(widget.diseaseName)]["treatments"];
      this.disTreatment  = disTreatments
          .map((item) => '${disTreatments.indexOf(item) + 1}. $item')
          .join('\n');
      final disPrevention =
          data[toDiseaseCase(widget.diseaseName)]["prevention"];
      this.disPrevention  = disPrevention
          .map((item) => '${disPrevention.indexOf(item) + 1}. $item')
          .join('\n');
      // print(this.disPrevention);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
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
                            Text(disScName,
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
                            Text(disSymptoms,
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
                            Text(disCauses,
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
                            Text(disTreatment,
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
                            Text(disPrevention,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
