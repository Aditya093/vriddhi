import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/crop_guide_list.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';

// late CropGuideContent cropGuideObject ;
class CropGuideScreen extends StatefulWidget {
  static const String id = 'crop_guide_screen';
  @override
  State<CropGuideScreen> createState() => _CropGuideScreenState();
}

class _CropGuideScreenState extends State<CropGuideScreen> {

  List<CardContentCropGuide> displayList = List.from(CropGuideList.cropGuideList);

  void updateList(String value){
      setState(() {
        displayList = CropGuideList.cropGuideList.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
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
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search Crops",
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon: Icon(Icons.notifications),
                    prefixIconColor: kSearchBarTextColor,
                    // suffixIconColor: kSearchBarColor,
                  ),
                ),
                // GridView.builder(gridDelegate: gridDelegate)
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,),
                    itemBuilder: (BuildContext context, int index) {
                      CropGuideList().sortingList();
                      final current_crop = displayList[index];
                      return SquareCard(colour: Colors.white, cardChild: current_crop, onPress: (){});
                    },
                    itemCount: displayList.length,
                  ),
                ),
                //Nav Bar
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CropCard extends StatelessWidget {
//   CropCard({required this.cropName, required this.cropImagePath});
//   final String cropName;
//   final String cropImagePath;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 150,
//       color: Colors.yellow,
//       child: Stack(children: [
//         //Title container
//         Align(
//           alignment: Alignment.topLeft,
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(25),
//                 )),
//             height: 170,
//             width: 150,
//             margin: EdgeInsets.only(top: 20, right: 10),
//             child: Container(
//               padding: EdgeInsets.only(left: 15),
//               margin: EdgeInsets.only(top: 110, bottom: 2),
//               height: 50,
//               width: 50,
//               // color: Colors.blue,
//
//               //Crop Title
//               child: Container(
//                 alignment: Alignment.topCenter,
//                 margin: EdgeInsets.only(right: 18),
//                 child: Text(
//                   cropName,
//                   style: TextStyle(
//                     color: kFontColor,
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //Image Container
//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             margin: EdgeInsets.only(right: 32, top: 20),
//             height: 120,
//             width: 120,
//             child: Image.asset(cropImagePath),
//           ),
//         ),
//       ]),
//     );
//   }
// }
