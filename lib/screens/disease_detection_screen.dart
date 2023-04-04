import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vriddhi_0/constants.dart';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:vriddhi_0/screens/disease_details_screen.dart';
import 'package:vriddhi_0/screens/disease_guide_screen.dart';
import 'package:vriddhi_0/url.dart';

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
  State<DiseaseDetectionFeature> createState() =>
      _DiseaseDetectionFeatureState();
}

class _DiseaseDetectionFeatureState extends State<DiseaseDetectionFeature> {
  File? image;
  String report = '';
  bool gotResponse = false;
  bool buttonShow = true;
  final ImagePicker picker = ImagePicker();
  List<String> diseaseCauses = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/disease_guide.json');
    final data = await jsonDecode(response) ;
    setState(()  {
      final diseaseData = data[toDiseaseCase(report)];
      dynamic diseaseCauses = data[toDiseaseCase(report)]["causes"];
      this.diseaseCauses = diseaseCauses;
      print("success 1");
    });
  }

  String toDiseaseCase(String input) {
    List<String> words = input.split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] = "${words[i][0].toUpperCase()}${words[i].substring(1)}";
    }
    return words.join('_');
  }
  //we can upload from gallery
  Future getImage(ImageSource source) async {
    try {
      var img = await picker.pickImage(source: source);

      setState(() {
        image = File(img!.path);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future upload(File imageFile) async {
    // open a bytestream
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(UDiseaseURL);

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    // send

    var response = await request.send();

    if (response.statusCode == 200)
      gotResponse = true;

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      setState(() {
        report = jsonDecode(value)["class1"];
      });
    });
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
                  onPressed: () async {
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
                  onPressed: () async {
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
              height: 30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonPositiveColor, // Background color
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    // <-- Icon
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
              onPressed: () async {
                try {
                  await upload(image!);
                  if (gotResponse){
                    readJson();
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context)
                                    .viewInsets
                                    .bottom),
                            child: DiseaseResultModal(diseaseResult: report,)
                        ),),
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please try again'),
                      ),
                    );
                  }
                } catch (e) {
                  print("Exception caught");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class DiseaseResultModal extends StatefulWidget {
  DiseaseResultModal({required this.diseaseResult});

  late String diseaseResult;

  @override
  State<DiseaseResultModal> createState() => _DiseaseResultModalState();
}

class _DiseaseResultModalState extends State<DiseaseResultModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Result",
                  style: kFormPrimaryHeadingStyle,
                ),
                Text(
                  'Results are based on our study, real results may vary',
                  style: kFormSecondaryHeadingStyle,
                ),
                SizedBox(height: 5.0),
                Center(
                  child: Text(
                    widget.diseaseResult.toCapitalCase(),
                    style:
                        kFormPrimaryHeadingStyle.copyWith(color: kDangerColor),
                  ),
                ),
                // Text('Causes: ', style: kFormTextFieldLabelStyle),
                // Text(
                //   '1. Fungal infection by Puccinia sorghi\n2.Favors warm temperatures (60-80°F) and high humidity\n3.Spreads rapidly in fields with high nitrogen levels',
                //   style: kFormTextFieldLabelStyle.copyWith(fontSize: 15.0),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DiseaseDetailsScreen(diseaseName: widget.diseaseResult)));
                    },
                    child: Text(
                      'Know More',
                      style: TextStyle(color: Colors.white, height: 1),
                    ),
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
