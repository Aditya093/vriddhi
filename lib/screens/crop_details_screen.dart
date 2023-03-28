import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:change_case/change_case.dart';

class CropDetailsScreen extends StatefulWidget {
  static const String id = 'crop_details_screen';
  final int cropId;
  CropDetailsScreen({required this.cropId});
  @override
  State<CropDetailsScreen> createState() => _CropDetailsScreenState();
}

class _CropDetailsScreenState extends State<CropDetailsScreen> {
  //variables
  final String collection = 'crop_data';
  final db = FirebaseFirestore.instance;
  bool _isLoading = false;
  late String fertilizers,
      crop,
      sowingAndSeedPlanting,
      varietiesRecommended,
      growthClimate,
      interCulturalOperation,
      introduction,
      landPrep,
      manuring,
      methodOfPlanting,
      nutritionalDeficienciesAndTheirManagement,
      rePlantingOrUnderPlanting,
      soil,
      spacing,
      youngPalms,
      weeding;


  //all the methods


  void getData() async {
    await db.collection(collection).where("id", isEqualTo: widget.cropId).get().then(
      (querySnapshot) async {
        for (var docSnapshot in querySnapshot.docs) {
          await docSnapshot.data();
          var fertilizers = docSnapshot["fertilizers"];
          this.fertilizers = fertilizers;
          var crop = docSnapshot["crop"];
          this.crop = crop;
          var sowingAndSeedPlanting = docSnapshot["Sowing and seed planting"];
          this.sowingAndSeedPlanting = sowingAndSeedPlanting;
          var varietiesRecommended = docSnapshot["Varieties recommended"];
          this.varietiesRecommended = varietiesRecommended;
          var growthClimate = docSnapshot["growth climate"];
          this.growthClimate = growthClimate;
          var interCulturalOperation = docSnapshot["intercultural operation"];
          this.interCulturalOperation = interCulturalOperation;
          var introduction = docSnapshot["introduction"];
          this.introduction = introduction;
          var landPrep = docSnapshot["land preparation"];
          this.landPrep = landPrep;
          var manuring = docSnapshot["manuring"];
          this.manuring = manuring;
          var methodOfPlanting = docSnapshot["method of planting"];
          this.methodOfPlanting = methodOfPlanting;
          var nutritionalDeficienciesAndTheirManagement =
              docSnapshot["nutritional deficiencies and their management"];
          this.nutritionalDeficienciesAndTheirManagement =
              nutritionalDeficienciesAndTheirManagement;
          var rePlantingOrUnderPlanting =
              docSnapshot["re-planting or under-planting"];
          this.rePlantingOrUnderPlanting = rePlantingOrUnderPlanting;
          var soil = docSnapshot["soil"];
          this.soil = soil;
          var spacing = docSnapshot["spacing"];
          this.spacing = spacing;
          var weeding = docSnapshot["weeding"];
          this.weeding = weeding;
          var youngPalms = docSnapshot["young palms"];
          this.youngPalms = youngPalms;
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
                      child: Image.asset('assets/images/crops/Crop_${crop.toPascalCase()}.png',height: 200,width: 200,),),
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
                      'Climate': growthClimate,
                      'Soil': soil,
                      'Varieties Recommended': varietiesRecommended,
                      'Sowing and Seed Planting': sowingAndSeedPlanting,
                      'Method of Planting': methodOfPlanting,
                      'Care': youngPalms,
                      'Land Preparation': landPrep,
                      'Spacing': spacing,
                      'Manuring': manuring,
                      'Fertilizers': fertilizers,
                      'Inter-cultural operation': interCulturalOperation,
                      'Weeding': weeding,
                      'Replanting or Under Planting': rePlantingOrUnderPlanting,
                      'Nutritional Deficiences and their Management': nutritionalDeficienciesAndTheirManagement,

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


