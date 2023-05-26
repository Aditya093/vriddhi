import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:change_case/change_case.dart';

class CropDetailsScreen extends StatefulWidget {
  static const String id = 'crop_details_screen';
  final dynamic cropId;
  final String imageURL;
  CropDetailsScreen({required this.cropId,required this.imageURL});
  @override
  State<CropDetailsScreen> createState() => _CropDetailsScreenState();
}

class _CropDetailsScreenState extends State<CropDetailsScreen> {
  //variables
  final String collection = 'crop_guide';
  final db = FirebaseFirestore.instance;

  bool _isLoading = false;
  late String fertilizers,
      crop,
      sowingAndSeedPlanting,
      varietiesRecommended,
      climate,
      interCulturalOperation,
      introduction,
      landPrep,
      manuring,
      methodOfPlanting,
      nutritionalDeficienciesAndTheirManagement,
      rePlantingOrUnderPlanting,
      soil,
      spacing,
      care,
      weeding,yeild,diseaseAndTheirManagement,insectPestAndTheirManagement,specialProblems;


  //all the methods


  Future<void> getData() async {
    await db.collection(collection).where("ID", isEqualTo: widget.cropId).get().then(
      (querySnapshot) async {
        for (var docSnapshot in querySnapshot.docs) {
          // await docSnapshot.data();
          var crop = docSnapshot["Crop Name"];
          this.crop = crop;
          print(this.crop);
          var fertilizers = docSnapshot["Fertilizers"];
          this.fertilizers = fertilizers;
          var sowingAndSeedPlanting = docSnapshot["Sowing and Seed Planting"];
          this.sowingAndSeedPlanting = sowingAndSeedPlanting;
          var varietiesRecommended = docSnapshot["Varieties Recommended"];
          this.varietiesRecommended = varietiesRecommended;
          var climate = docSnapshot["Climate"];
          this.climate = climate;
          var interCulturalOperation = docSnapshot["Inter-cultural operations"];
          this.interCulturalOperation = interCulturalOperation;
          var introduction = docSnapshot["Introduction"];
          this.introduction = introduction;
          var landPrep = docSnapshot["Land preparation"];
          this.landPrep = landPrep;
          var manuring = docSnapshot["Manuring"];
          this.manuring = manuring;
          var methodOfPlanting = docSnapshot["Method of Planting"];
          this.methodOfPlanting = methodOfPlanting;
          var nutritionalDeficienciesAndTheirManagement =
              docSnapshot["Nutritional Deficiencies and Their Management"];
          this.nutritionalDeficienciesAndTheirManagement =
              nutritionalDeficienciesAndTheirManagement;
          var rePlantingOrUnderPlanting =
              docSnapshot["Replanting or Underplanting"];
          this.rePlantingOrUnderPlanting = rePlantingOrUnderPlanting;
          var soil = docSnapshot["Soil"];
          this.soil = soil;
          var spacing = docSnapshot["Spacing"];
          this.spacing = spacing;
          var weeding = docSnapshot["Weeding"];
          this.weeding = weeding;
          var care = docSnapshot["Care"];
          this.care = care;
          var yeild = docSnapshot["Yield"];
          this.yeild = yeild;
          var specialProbs = docSnapshot["Special problems"];
          this.specialProblems = specialProbs;
          var diseaseMang = docSnapshot["Disease and Their Management"];
          this.diseaseAndTheirManagement = diseaseMang;
          var insectPestMang = docSnapshot["Insect, Pest and Their Management"];
          this.insectPestAndTheirManagement = insectPestMang;


          setState(() {
            _isLoading = true;
          });
          print("success 1");
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

  }


  @override
  void initState() {
    super.initState();
    getData();
    print("success 2");
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (_isLoading) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  20.0),
              child: ListView(
                children: [
                  //Crop Title + menu icon
                  ListTile(
                    title: Center(
                      child: Text(
                       crop.toCapitalCase(),
                        style: kWeekTitleTS,
                      ),
                    ),
                  ),
                  Center(
                      child: Image.network(widget.imageURL,height: 200,width: 200,),),
                  //Characteristics
                  // Text(
                  //   'Characteristics',
                  //   style: const TextStyle(fontSize: 23, color: kNavyBlueColor),
                  // ),
                  SizedBox(
                    height: 8,
                  ),
                  // Characteristic cards
                  Column(
                    children: {
                      'Introduction' : introduction,
                      'Climate': climate,
                      'Soil': soil,
                      'Varieties Recommended': varietiesRecommended,
                      'Sowing and Seed Planting': sowingAndSeedPlanting,
                      'Method of Planting': methodOfPlanting,
                      'Care': care,
                      'Land Preparation': landPrep,
                      'Spacing': spacing,
                      'Manuring': manuring,
                      'Fertilizers': fertilizers,
                      'Inter-cultural operation': interCulturalOperation,
                      'Weeding': weeding,
                      'Replanting or Under Planting': rePlantingOrUnderPlanting,
                      'Nutritional Deficiences and their Management': nutritionalDeficienciesAndTheirManagement,
                      'Insect, Pest and Their Management': insectPestAndTheirManagement,
                      'Yield': yeild,
                      'Disease Management': diseaseAndTheirManagement,
                      'Special Problems':specialProblems,
                    }.entries.map((entry) {
                      // doSomething(entry.key);
                      return DropdownToggleCard(title: entry.key, content: entry.value);
                    }).toList(),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Center(
            child: CircularProgressIndicator(
              color: kNavyBlueColor,
            ),
          ),
        );
      }
    } catch (e) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: CircularProgressIndicator(
            color: kNavyBlueColor,
          ),
        ),
      );
    }
  }
}


