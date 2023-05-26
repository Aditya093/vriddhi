import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacementNamed(context, '/current_bottom_navbar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryAppColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo/logo.png',
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
