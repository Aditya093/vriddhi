import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:vriddhi_0/widgets/result_modal.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';


class SoilDetailsScreen extends StatelessWidget {
  static const String id = 'soil_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: ReusableWidgets.smallAppBar('Predict'),
        body: SoilDetailsForm(),
      );
  }
}
class SoilDetailsForm extends StatefulWidget {
  @override
  State<SoilDetailsForm> createState() => _SoilDetailsFormState();
}

class _SoilDetailsFormState extends State<SoilDetailsForm> {

  bool _showFields = false; // private variable that decides whether to show more textfields or not.

  File? image;
  String report = '';
  // bool showProcessing = false;
  bool buttonShow = true;

  final ImagePicker picker = ImagePicker();

  //we can upload from gallery
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crop Prediction",
                style: kFormPrimaryHeadingStyle,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Soil Details",
                    style: kFormTextFieldLabelStyle.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!_showFields)
                          Text(
                            'Have you performed a soil test ? ',
                            style: kFormTextFieldLabelStyle,
                          ),
                        if (!_showFields)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <ElevatedButton>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontFamily: "Catamaran",
                                  ),
                                  backgroundColor: kButtonPositiveColor,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Are you sure you had your Soil Tested"),
                                        content: Text(
                                            'Soil must be tested once after each crop season'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  setState(() {
                                    _showFields = true;
                                  });
                                },
                                child: Text('Yes'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontFamily: "Catamaran",
                                  ),
                                  backgroundColor: kButtonNegativeColor,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Need Soil Test Results"),
                                        content: Text(
                                            'Please first have the soil tested.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              //will redirect the page to soil testing page.
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'No',
                                  style:
                                  TextStyle(color: kButtonPositiveColor),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_showFields)
                Column(
                  children: [
                    Center(
                      child: Text(
                        "Please upload an image of your Soil Tests",
                        style: kFormSecondaryHeadingStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonPositiveColor, // Background color
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon( // <-- Icon
                            Icons.upload,
                            size: 24.0,
                          ),
                          Text('Upload Soil Tests',),
                          // <-- Text
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        await getImage(ImageSource.gallery);
                        setState(() {
                          // showProcessing = true;
                          // buttonShow = false;
                        });
                      } ,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    image != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    ) : const Text(
                      "No image choosen",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 163, 163, 163)),
                    ),
                    SizedBox(
                      height:30.0,
                    ),
                    if (buttonShow)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kButtonNegativeColor, // Background color
                        ),
                        child: Text("Done", style: TextStyle(color: kButtonPositiveColor)), // <-- Text
                        onPressed:  () async {
                          setState(() {
                            // showProcessing = true;
                          });
                          // upload(image!);
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child:Container(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: ResultModal(),
                              ),
                            ),
                          );
                        } ,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

