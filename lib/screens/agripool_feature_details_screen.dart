import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/agripool_feature_screen.dart';

class AgriPoolFeatureDetailsScreen extends StatelessWidget {
  static const String id = 'agripool_feature_details_screen';

  const AgriPoolFeatureDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Center(
                    child: Text(
                      "Leaves",
                      style: kWeekTitleTS,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              SizedBox(height:15.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset("assets/images/pool_features/Pool_Leaves.png", height: 250.0, width: 250.0,),
                    Text(
                      "Help us improve our leaf detection model\nFor capturing images of objects:",
                      style: kFormTextFieldLabelStyle,
                    ),
                    SizedBox(height:10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        " 1. Find an object that you want to capture.\n 2. Place the object on a flat surface with good lighting, preferably in natural light.\n 3.Ensure that there is no shadow falling on the object.\n 4. Hold the camera parallel to the object to get a clear view of the entire object.\n 5. Zoom in or out to get a proper focus on the object.\n 6. Make sure that the camera lens is perpendicular to the object to avoid distortion.",
                        style: kFormTextFieldLabelStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15.0),
              Text(
                "Capturing images of different objects can help improve a leaf detection model in several ways. By including images of other objects, you can help the model learn to differentiate between leaves and other objects that may be present in the image. This can help reduce false positives and improve the accuracy of the model.",
                style: kFormTextFieldLabelStyle.copyWith(fontSize: 18),
              ),
              SizedBox(height:25.0),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, AgriPoolFeatureScreen.id);
                  } ,
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
        ),
      ),
    ));
  }
}
