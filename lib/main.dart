import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/location_data.dart';
import 'package:vriddhi_0/global_listeners/selected_crop.dart';
import 'package:vriddhi_0/global_listeners/temperature_data.dart';
import 'package:vriddhi_0/global_listeners/user_data.dart';
import 'package:vriddhi_0/screens/agripool_feature_screen.dart';
import 'package:vriddhi_0/screens/agripool_screen.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/blog_info_screen.dart';
import 'package:vriddhi_0/screens/crops_classfication_screen.dart';
import 'package:vriddhi_0/screens/current_screen.dart';
import 'package:vriddhi_0/screens/disease_detection_screen.dart';
import 'package:vriddhi_0/screens/disease_guide_screen.dart';
import 'package:vriddhi_0/screens/explore_screen.dart';
import 'package:vriddhi_0/screens/farming_techniques_screen.dart';
import 'package:vriddhi_0/screens/get_started.dart';
import 'package:vriddhi_0/screens/home_screen.dart';
import 'package:vriddhi_0/screens/login_screen.dart';
import 'package:vriddhi_0/screens/news_screen.dart';
import 'package:vriddhi_0/screens/progress_screen.dart';
import 'package:vriddhi_0/screens/registration_screen.dart';
import 'package:vriddhi_0/screens/soil_details_screen.dart';
import 'package:vriddhi_0/screens/soil_testing_screen.dart';
import 'package:vriddhi_0/screens/splash_screen.dart';
import 'package:vriddhi_0/screens/user_profile_screen.dart';
import 'package:vriddhi_0/screens/weather_screen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Vriddhi());
}

UserData userData = UserData();
class Vriddhi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherDataAll>(create: (_) => WeatherDataAll()),
        ChangeNotifierProvider<LocationData>(create: (_) => LocationData()),
        ChangeNotifierProvider<UserData>(create: (_) => UserData()),
        ChangeNotifierProvider<SelectedCrop>(create: (_) => SelectedCrop()),
      ],
      child: MaterialApp(
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
          // '/':(context) => ProgressScreen(),
          '/': (context) => AuthenticationWrapper(),
          '/splash' :(context) => SplashScreen(),
          '/get_started': (context) => GetStartedScreen(),
          '/registration': (context) => RegistrationScreen(),
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/crop_classification': (context) => CropClassificationScreen(),
          '/progress': (context) => ProgressScreen(),
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
          'privacy-policy':(context) => PrivacyPolicyScreen(),
          'about_us':(context) => AboutUsScreen(),
          'terms_of_service': (context) => TermsOfServiceScreen(),
        },
      ),
    );
  }
}



class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser == null){
      return RegistrationScreen();
    }
    else{
      return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitDoubleBounce(color: kPrimaryAppColor,size: 100,);
          }
          else if (snapshot.hasData && snapshot.data != null) {
            // User is logged in, retrieve the username from the snapshot
            String username = snapshot.data!.get('username');
            final userDataUsername = Provider.of<UserData>(context, listen: false);
            userDataUsername.setUsername(username);
            //navigate to home screen then
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/splash');
            });
          }
          else {
            return Text('Error retrieving user data');
          }
          return Container();
        },);
    }

  }
}

