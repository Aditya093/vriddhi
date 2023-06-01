import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/crop_details_screen.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';


// late CropGuideContent cropGuideObject ;
class CropGuideScreen extends StatefulWidget {
  CropGuideScreen({required this.category});
  late final String? category;
  @override
  State<CropGuideScreen> createState() => _CropGuideScreenState();
}

class _CropGuideScreenState extends State<CropGuideScreen> {
  //variables
  List<Map<String, dynamic>> cropList = [];
  late List<Map<String, dynamic>>  displayList = List.from(cropList);

  // Fetch data from Firebase and extract title names and image URLs
  Future<List<Map<String, dynamic>>> fetchData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('crop_guide').where('Crop Type',isEqualTo: widget.category).get();

    List<Map<String, dynamic>> data = [];
    for (DocumentSnapshot doc in snapshot.docs) {
      String titleName = doc['Crop Name'];
      String imageURL = doc['Image'];
      int id = doc['ID'];
      data.add({
        'id': id,
        'title': titleName,
        'imageURL':
            'https://raw.githubusercontent.com/AyushSolanki-17/StaticServer/main/SolutionChallenge/Vriddhi%20Crops/$imageURL',
      });
    }

    return data;
  }

  void updateList(String value) {
    setState(() {
      displayList = cropList
          .where((element) =>
          element['title'].toLowerCase().contains(value.toLowerCase()))
          .toList();

    });
  }

  void initState() {
    super.initState();
    fetchData().then((result) {
      setState(() {
        cropList = result;
        displayList = cropList;
      });

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
                    hintText: "Search Crops",
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon: Icon(Icons.notifications),
                    prefixIconColor: kSearchBarTextColor,
                    // suffixIconColor: kSearchBarColor,
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    itemCount: displayList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of cards in a row
                    ),
                    itemBuilder: (context, index) {
                      String title = displayList[index]['title'];
                      String imageURL = displayList[index]['imageURL'];

                      return GestureDetector(
                      onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CropDetailsScreen(cropId: cropList[index]['id'], imageURL: cropList[index]['imageURL'],),
                            ),
                          );
                        },
                        child: SquareCard(
                          cardChild: Column(
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: imageURL,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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

// child: GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//   ),
//   itemBuilder: (BuildContext context, int index) {
//     CropGuideList().sortingList();
//     final current_crop = displayList[index];
//     return GestureDetector(
//       onTap: (){
//         // print("${displayList[index].id}");
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CropDetailsScreen(cropId: displayList[index].id),
//           ),
//         );
//       },
//       child: SquareCard(
//         colour: Colors.white,
//         cardChild: current_crop,
//         // onPress: () => onTapped(index),
//       ),
//     );
//   },
//   itemCount: displayList.length,
// ),