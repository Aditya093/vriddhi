// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vriddhi_0/screens/home_screen.dart';
// import 'package:vriddhi_0/screens/registration_screen.dart';
// import 'package:vriddhi_0/services/auth_service.dart';
// class LandingPage extends StatefulWidget {
//   const LandingPage({Key? key}) : super(key: key);
//
//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> {
//   late User _user;
//   // AuthService _auth = AuthService();
//   bool _showSpinner = false;
//   // FirestoreDatabase database = FirestoreDatabase();
//   _checkStatusAndRedirect() async {
//     // Checking if the user is logged in or not.
//     // Redirecting to the home screen if the user is logged in.
//     // NOTE: A future is used instead of a stream since we only need to check
//     // once and not continuously.
//     setState(() {
//       this._showSpinner = true;
//     });
//     // String? username = await AuthService().getUsername();
//     // User? currentUser = await this._auth.getUser;
//     // String? userEmail = await AuthService().getEmail();
//     // Map<String, dynamic> userData = await database.getUserData(userEmail);
//     setState(() {
//       this._showSpinner = false;
//     });
//     if (currentUser != null) {
//       // Pushing a replacement since we don't want the back button in the
//       // home screen leading back to the landing page.
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(
//             username: username,
//             userData: userData,
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     this._checkStatusAndRedirect();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(_user == null){
//       return RegistrationScreen();
//     }
//     else{
//       return Container();
//     }
//   }
// }
