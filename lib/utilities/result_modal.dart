import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:change_case/change_case.dart';
import 'package:vriddhi_0/firebase_custom_variables/task_date_data.dart';
import 'package:vriddhi_0/global_listeners/selected_crop.dart';
import 'package:vriddhi_0/screens/crop_details_screen.dart';
import 'package:vriddhi_0/services/get_current_date.dart';

class ResultModal extends StatefulWidget {
  const ResultModal(
      {required this.cropName,
      required this.probability,
      required this.production,
      required this.price});

  final String cropName;
  final String probability;
  final double production;
  final double price;

  @override
  State<ResultModal> createState() => _ResultModalState();
}

class _ResultModalState extends State<ResultModal> {
  bool isSelected = false;
  bool isLoading = true;
  String imageUrl = '';
  dynamic cropID;
  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Future<void> fetchImageAndID() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('crop_guide')
          .where('Crop Name', isEqualTo: widget.cropName)
          .limit(1)
          .get();
      final documents = snapshot.docs;
      final doc = documents.first;
      dynamic imageURL = doc['Image'] as String?;
      this.cropID = doc['ID'];
      this.imageUrl =
          'https://raw.githubusercontent.com/AyushSolanki-17/StaticServer/main/SolutionChallenge/Vriddhi%20Crops/${imageURL.toString()}';
    } catch (e) {
      print("Error fetching image $e");
    }
  }

  Future<void> initializeFetching() async {
    await fetchImageAndID();
    print(imageUrl);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFetching();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? kLoader
        : Container(
            color: Color(0xff757575),
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.minus,
                    size: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crop Recommendations',
                        style: kFormPrimaryHeadingStyle,
                      ),
                      Text(
                        'This are based on your preferences',
                        style: kFormSecondaryHeadingStyle,
                      ),
                      GestureDetector(
                        onTap: _toggleSelection,
                        child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/temp/Trending_Icon.png'),
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                  ),
                                  Text(
                                    widget.cropName.toCapitalCase(),
                                    style: kFormTextFieldLabelStyle.copyWith(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  IconButton(
                                    icon: isSelected
                                        ? Icon(Icons.check_circle_outline)
                                        : Icon(
                                            Icons.radio_button_unchecked,
                                            color: Colors.white,
                                          ),
                                    onPressed: _toggleSelection,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                widget.probability + "%",
                                                style: kFormTextFieldLabelStyle
                                                    .copyWith(
                                                  fontSize: 50.0,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Flexible(
                                                child: Text(
                                                  'Success Rate',
                                                  style:
                                                      kFormTextFieldLabelStyle
                                                          .copyWith(
                                                              fontSize: 12.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Expected Produce",
                                      style: kFormTextFieldLabelStyle.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.seedling,
                                                color: kButtonPositiveColor,
                                                size: 20.0),
                                            SizedBox(width: 6.0),
                                            Text(
                                              "${widget.production.toStringAsFixed(1)} Qtl",
                                              style: kFormTextFieldLabelStyle,
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Color(0xFF88D197),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                                FontAwesomeIcons
                                                    .indianRupeeSign,
                                                color: kButtonPositiveColor,
                                                size: 20.0),
                                            SizedBox(width: 6.0),
                                            Text(
                                              "${widget.price}",
                                              style: kFormTextFieldLabelStyle,
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Color(0xFF88D197),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "(* Results Based on Historical Data, Actual Results May Vary )",
                                    style: kFormSecondaryHeadingStyle.copyWith(
                                        fontSize: 10.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      if (isSelected)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 36.0,
                              width: 98.0,
                              child: ElevatedButton(
                                onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CropDetailsScreen(cropId: cropID, imageURL: this.imageUrl)));
                                },
                                child: Text(
                                  'Know More',
                                  style: TextStyle(
                                      color: kButtonPositiveColor,
                                      height: 1,
                                      fontSize: 13),
                                ),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontFamily: "Catamaran",
                                  ),
                                  backgroundColor: kButtonNegativeColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 36.0,
                              width: 98.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  final currentCrop = Provider.of<SelectedCrop>(
                                      context,
                                      listen: false);
                                  currentCrop.setCurrentCrop(widget.cropName);
                                  String current_date =
                                      CurrentDate.getCurrentDate();
                                  FirebaseTaskDateData.setCropDates(
                                      widget.cropName,
                                      startDate: current_date,
                                      endDate: null);
                                  Navigator.pushReplacementNamed(
                                      context, '/progress');
                                },
                                child: Text('Next'),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontFamily: "Catamaran",
                                  ),
                                  backgroundColor: kButtonPositiveColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
