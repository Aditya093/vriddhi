import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/screens/current_screen.dart';
import 'package:vriddhi_0/screens/disease_detection_screen.dart';
import 'package:vriddhi_0/screens/dummy_my_screen.dart';
import 'package:vriddhi_0/screens/explore_screen.dart';
import 'package:vriddhi_0/screens/get_started.dart';
import 'package:vriddhi_0/screens/home_screen.dart';
import 'package:vriddhi_0/screens/login_screen.dart';
import 'package:vriddhi_0/screens/progress_screen.dart';
import 'package:vriddhi_0/screens/progress_task_details_screen.dart';
import 'package:vriddhi_0/screens/registration_screen.dart';
import 'package:vriddhi_0/screens/soil_details_screen.dart';
import 'package:vriddhi_0/screens/splash_screen.dart';
import 'package:vriddhi_0/screens/weather_screen.dart';

void main() {
  runApp(Vriddhi());
}

class Vriddhi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // secondary: Colors.green,
          primary: kBackgroundColor,
        ),
        fontFamily: 'Jaldi',
        textTheme: TextTheme(
          bodyLarge: TextStyle(height: 1),
          bodySmall: TextStyle(height: 1),
          bodyMedium: TextStyle(height: 1, color: kNavyBlueColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id : (context) => SplashScreen(),
        GetStartedScreen.id : (context) => GetStartedScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        HomeScreen.id : (context) => HomeScreen(),
        CropGuideScreen.id :(context) => CropGuideScreen(),
        ProgressScreen.id: (context) => ProgressScreen(),
        ProgressTaskDetailsScreen.id: (context) => ProgressTaskDetailsScreen(),
        SoilDetailsScreen.id: (context) => SoilDetailsScreen(),
        BasicDetailsScreen.id : (context) => BasicDetailsScreen(),
        CurrentBottomNavBarScreen.id : (context) => CurrentBottomNavBarScreen(),
        WeatherScreen.id : (context) => WeatherScreen(),
        ExploreScreen.id : (context) => ExploreScreen(),
        DiseaseDetectionScreen.id : (context) => DiseaseDetectionScreen(),
      },
    );
  }
}
