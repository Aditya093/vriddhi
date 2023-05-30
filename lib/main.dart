import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/agripool_feature_screen.dart';
import 'package:vriddhi_0/screens/agripool_screen.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/blog_info_screen.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/screens/crops_classfication_screen.dart';
import 'package:vriddhi_0/screens/current_screen.dart';
import 'package:vriddhi_0/screens/disease_detection_screen.dart';
import 'package:vriddhi_0/screens/disease_guide_screen.dart';
import 'package:vriddhi_0/screens/explore_screen.dart';
import 'package:vriddhi_0/screens/farming_techniques_screen.dart';
import 'package:vriddhi_0/screens/get_started.dart';
import 'package:vriddhi_0/screens/home_screen.dart';
import 'package:vriddhi_0/screens/landing_page.dart';
import 'package:vriddhi_0/screens/login_screen.dart';
import 'package:vriddhi_0/screens/news_screen.dart';
import 'package:vriddhi_0/screens/progress_screen.dart';
import 'package:vriddhi_0/screens/registration_screen.dart';
import 'package:vriddhi_0/screens/soil_details_screen.dart';
import 'package:vriddhi_0/screens/soil_testing_screen.dart';
import 'package:vriddhi_0/screens/splash_screen.dart';
// import 'package:vriddhi_0/screens/test.dart';
import 'package:vriddhi_0/screens/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Vriddhi());
}

class Vriddhi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Jaldi',
        textTheme: const TextTheme(
          bodyLarge: const TextStyle(height: 1),
          bodySmall: const TextStyle(height: 1),
          bodyMedium: const TextStyle(height: 1, color: kNavyBlueColor),
        ),
      ),

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {

        '/': (context) => AuthenticationWrapper(),
        '/splash' :(context) => SplashScreen(),
        // '/landing': (context) => LandingPage(),
        '/get_started': (context) => GetStartedScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/crop_classification': (context) => CropClassificationScreen(),
        '/progress': (context) => ProgressScreen(cropName: "Maize",),
        '/soil_details': (context) => SoilDetailsScreen(),
        '/basic_details': (context) => BasicDetailsScreen(),
        '/current_bottom_navbar': (context) => CurrentBottomNavBarScreen(),
        '/weather': (context) => WeatherScreen(),
        '/explore': (context) => ExploreScreen(),
        '/disease_detection': (context) => DiseaseDetectionScreen(),
        '/agri_pool': (context) => AgriPoolScreen(),
        '/agri_pool_feature': (context) => AgriPoolFeatureScreen(),
        '/disease_guide': (context) => DiseaseGuideScreen(),
        '/soil_testing': (context) => SoilTestingScreen(),
        '/news': (context) => NewsScreen(),
        '/blog_info': (context) => BlogInfoScreen(),
        '/farming_technique':(context) => FarmingTechniquesScreen(),

      },
    );
  }
}



class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          if (snapshot.hasData) {
            // User is logged in, navigate to home
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/current_bottom_navbar');
            });
          } else {
            // User is not logged in, navigate to login
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/login');
            });
          }
          return Container(); // Placeholder widget
        }
      },
    );
  }
}
