import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/login_screen.dart';
import 'package:vriddhi_0/screens/registration_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static const String id = 'get_started_screen';

  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryAppbarColor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 8,),
                Icon(FontAwesomeIcons.seedling, color: kPrimaryGreenColor),
                Image(image: AssetImage("assets/images/temp/Get_started.png"),),
                Text("Grow & Earn", style: TextStyle(fontFamily: "Blinker", color:Colors.white, fontSize: 50.0),),
                Center(child: Text("Farming made easy,\nall your farming requirements\nat one stop", style: TextStyle(fontFamily: "Blinker", color:Colors.white, fontSize: 18.0), textAlign: TextAlign.center, ),),
                SizedBox(height:30.0),
                SizedBox(
                  height:36.0,
                  width:158.0,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    } ,
                    child: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontFamily: "Catamaran",
                      ),
                      backgroundColor: kButtonPositiveColor,
                    ),
                  ),
                ),
                SizedBox(height:30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account ? ", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sign In !",
                          style: TextStyle(color: kButtonPositiveColor, fontSize: 16.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){Navigator.pushNamed(context, LoginScreen.id);},
                        ),
                      ],
                    ),),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
