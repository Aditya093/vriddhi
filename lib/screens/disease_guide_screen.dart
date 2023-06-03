import 'package:change_case/change_case.dart';
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
                SizedBox(height:20.0),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      AllDataList().diseaseListSorting();
                      final current_disease = displayList[index];
                      return GestureDetector(
                        onTap: (){
                          // Navigator.pushReplacement('')
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => DiseaseDetailsScreen(diseaseName: displayList[index].title),
                          //   ),
                          // );
                        },
                        child:Card(
                          color: Color(0xFFCCDBDC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Add an image widget to display an image
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8), // Image border
                                      child: SizedBox.fromSize(
                                        size: Size.fromRadius(35), // Image radius
                                        child:Image.asset(
                                          displayList[index].imagePath,
                                          width:25,
                                          height:25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Add some spacing between the image and the text
                                    Container(width: 20),
                                    // Add an expanded widget to take up the remaining horizontal space
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height:10.0),
                                          Text(
                                            displayList[index].title,
                                            style: TextStyle(fontSize: 20.0, color: kButtonPositiveColor),
                                          ),
                                          SizedBox(height:10.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  displayList[index].scientific_name,
                                                  style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_right_rounded, color: kButtonPositiveColor,),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

// ReusableCard(
// cardChild: current_disease,
// ),