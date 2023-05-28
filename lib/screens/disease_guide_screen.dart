import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/allDataList.dart';
import 'package:vriddhi_0/screens/disease_details_screen.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/widgets/reusable_rounded_card.dart';

class DiseaseGuideScreen extends StatefulWidget {
  @override
  State<DiseaseGuideScreen> createState() => _DiseaseGuideScreenState();
}

class _DiseaseGuideScreenState extends State<DiseaseGuideScreen> {

  List<DiseaseListTile> displayList = List.from(AllDataList.diseaseGuideList);


  void updateList(String value) {
    setState(() {
      displayList = AllDataList.diseaseGuideList
          .where((element) =>
          element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Search bar
                TextField(
                  onChanged: (value) => updateList(value),
                  style: TextStyle(
                    color: kSearchBarTextColor,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search Diseases",
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon: Icon(Icons.notifications),
                    prefixIconColor: kSearchBarTextColor,
                    // suffixIconColor: kSearchBarColor,
                  ),
                ),
                // GridView.builder(gridDelegate: gridDelegate)
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      AllDataList().diseaseListSorting();
                      final current_disease = displayList[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiseaseDetailsScreen(diseaseName: displayList[index].title),
                            ),
                          );
                        },
                        child: ReusableCard(
                          cardChild: current_disease,
                        ),
                      );
                    },
                    itemCount: displayList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}