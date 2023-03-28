import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';

class AgriPoolFeatureScreen extends StatelessWidget {
  static const String id = 'agripool_feature_screen';

  const AgriPoolFeatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/temp/BackgroundImage.png"),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.only(left:30.0, right: 30.0, top: 50.0),
            child: Column(
              children: [
                Text("Capture or Upload a Photo", style: kFormPrimaryHeadingStyle.copyWith(fontSize: 20.0),),
                SizedBox(height: 60.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(onPressed: (){}, child: Icon(FontAwesomeIcons.camera, color: kButtonPositiveColor, size: 30.0,),
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
                    OutlinedButton(onPressed: (){}, child: Icon(FontAwesomeIcons.images, color: kButtonPositiveColor, size: 30.0,),
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
