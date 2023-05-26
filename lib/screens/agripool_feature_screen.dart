import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/agripool_modal.dart';

class AgriPoolFeatureScreen extends StatefulWidget {

  const AgriPoolFeatureScreen({Key? key}) : super(key: key);

  @override
  State<AgriPoolFeatureScreen> createState() => _AgriPoolFeatureScreenState();
}

class _AgriPoolFeatureScreenState extends State<AgriPoolFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    File? profileimage;
    final ImagePicker picker = ImagePicker();

    //we can upload from gallery and camera
    Future getImage(ImageSource media) async {
      var img = await picker.pickImage(source: media);

      setState(() {
        profileimage = File(img!.path);
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/temp/BackgroundImage.png"),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
          child: Column(
            children: [
              Text(
                "Capture or Upload a Photo",
                style: kFormPrimaryHeadingStyle.copyWith(fontSize: 20.0),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      await getImage(ImageSource.camera);
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: AgriPoolModal(),
                        ),
                        // isScrollControlled: true,
                      );
                    },
                    child: Icon(
                      FontAwesomeIcons.camera,
                      color: kButtonPositiveColor,
                      size: 30.0,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      side: BorderSide(
                        width: 1.0,
                        color: Colors.black,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20.0),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      await getImage(ImageSource.gallery);
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: AgriPoolModal(),
                        ),
                        // isScrollControlled: true,
                      );
                    },
                    child: Icon(
                      FontAwesomeIcons.images,
                      color: kButtonPositiveColor,
                      size: 30.0,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      side: BorderSide(
                        width: 1.0,
                        color: Colors.black,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20.0),
                    ),
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
