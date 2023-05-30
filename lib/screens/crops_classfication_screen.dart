import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/allDataList.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class CropClassificationScreen extends StatelessWidget {
  //variables
  List<Map<String, String>> categoriesList = AllDataList.categoriesList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: ReusableWidgets.smallAppBar('Crop Guide'),
          backgroundColor: kBackgroundColor,
          body: Padding(
            padding: EdgeInsets.only(top:10, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: categoriesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CropGuideScreen(category: categoriesList[index]['value'])));
                        },
                        child: SquareCard(
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/categories/category_${categoriesList[index]['display']}.png',height: 120,width: 120,),
                              SizedBox(height: 5,),
                              Text(categoriesList[index]['display']!),
                            ],
                          ),

                        ),
                      );
                    },
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

// class GridviewGenerator extends StatelessWidget {
// GridviewGenerator({@required })
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: titleNames.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // Number of cards in a row
//       ),
//       itemBuilder: (context, index) {
//         return Card(
//           child: Center(
//             child: Text(titleNames[index]), // Display title on card
//           ),
//         );
//       },
//     );
//   }
// }
