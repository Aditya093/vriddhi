import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vriddhi_0/constants.dart';
import 'dart:io';
import 'dart:async';

import 'package:vriddhi_0/widgets/reusable_widgets.dart';


class DiseaseDetectionScreen extends StatelessWidget {
  static const String id = 'disease_detection_screen';

  const DiseaseDetectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReusableWidgets.smallAppBar('Detect'),
      body: DiseaseDetectionFeature(),
    );
  }
}

class DiseaseDetectionFeature extends StatefulWidget {
  const DiseaseDetectionFeature({Key? key}) : super(key: key);

  @override
  State<DiseaseDetectionFeature> createState() => _DiseaseDetectionFeatureState();
}

class _DiseaseDetectionFeatureState extends State<DiseaseDetectionFeature> {
  File? image;
  String report = '';
  // bool showProcessing = false;
  bool buttonShow = true;

  final ImagePicker picker = ImagePicker();

  //we can upload from gallery
  Future getImage(ImageSource source) async {
    try{
      var img = await picker.pickImage(source: source);

      setState(() {
        image = File(img!.path);
      });
    } on PlatformException catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                  )
                : Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      elevation: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                            "assets/images/feature_icons/Feature_Disease_Prediction.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            color: Color.fromRGBO(255, 255, 255, 0.7),
                            colorBlendMode: BlendMode.modulate),
                      ),
                    ),
                  ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    setState(() {
                      // showProcessing = true;
                    });
                    await getImage(ImageSource.camera);
                  },
                  child: Icon(
                    FontAwesomeIcons.camera,
                    color: kButtonPositiveColor,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonNegativeColor),
                ),
                ElevatedButton(
                  onPressed: () async{
                    setState(() {
                      // showProcessing = true;
                    });
                    await getImage(ImageSource.gallery);
                  },
                  child: Icon(
                    FontAwesomeIcons.images,
                    color: kButtonPositiveColor,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonNegativeColor),
                ),
              ],
            ),
            SizedBox(
              height:30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonPositiveColor, // Background color
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon( // <-- Icon
                    FontAwesomeIcons.microscope,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Evaluate'),
                  // <-- Text
                ],
              ),
              onPressed: (){
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
                      child: DiseaseResultModal(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class DiseaseResultModal extends StatefulWidget {
  const DiseaseResultModal({
    super.key,
  });

  @override
  State<DiseaseResultModal> createState() => _DiseaseResultModalState();
}

class _DiseaseResultModalState extends State<DiseaseResultModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child:Container(
          padding: EdgeInsets.only(left: 20.0, right:20.0, bottom: 20.0),
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F6),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              Icon(FontAwesomeIcons.minus, size: 30.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Results',
                    style: kFormPrimaryHeadingStyle,
                  ),
                  Text(
                    'Results are based on our study, real results may vary',
                    style: kFormSecondaryHeadingStyle,
                  ),
                  SizedBox(height:5.0),
                  Center(
                    child: Text(
                      'Maize Common Rust',
                      style: kFormPrimaryHeadingStyle.copyWith(color: Color(0xFFc71e1e)),
                    ),
                  ),
                  Text(
                    'Causes: ',
                    style: kFormTextFieldLabelStyle
                  ),
                  Text(
                      '1. Fungal infection by Puccinia sorghi\n2.Favors warm temperatures (60-80°F) and high humidity\n3.Spreads rapidly in fields with high nitrogen levels',
                      style: kFormTextFieldLabelStyle.copyWith(fontSize: 15.0),
                  ),
                  SizedBox(height: 20.0,),
                  //aa kare che kaam
                  Center(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('Know More', style: TextStyle(color: Colors.white, height: 1),),
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

      ),
    );
  }
}
