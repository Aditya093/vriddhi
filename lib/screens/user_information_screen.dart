import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/location_data.dart';
import 'package:vriddhi_0/global_listeners/selected_crop.dart';
import 'package:vriddhi_0/global_listeners/user_data.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class UserInformation extends StatefulWidget {
  static const routeName = '/user-information';

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  String email = '';

  void fetchUserEmail() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
       email = user.email!;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserEmail();
  }
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    final locationData = Provider.of<LocationData>(context);

    return Scaffold(
      appBar: ReusableWidgets.smallAppBar('User Information'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Container(
              height: 200,
              width: double.infinity,
              child: CircleAvatar(
                child: ClipOval(
                  child: userData.photoUrl.isNotEmpty
                      ? Image.memory(
                    base64Decode(userData.photoUrl),
                    // width: 100,
                    // height: 100,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    "assets/images/temp/User_Icon.jpg",
                    fit: BoxFit.cover,
                    // height: 150,
                    // width: 150,
                  ),
                ),
                backgroundColor: kButtonPositiveColor,
                radius: 60,
              ),
            ),
            SizedBox(height: 60.0),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.person,
                        size: 30.0, color: kButtonPositiveColor)),
                SizedBox(width: 8.0),
                Expanded(
                  child: Stack(
                    children: [
                      Text(
                        " " + userData.username,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 20.0,
                        child: Container(
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.email_rounded, color: kButtonPositiveColor),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Stack(
                    children: [
                      Text(
                        " " +email,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 20.0,
                        child: Container(
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.0),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.location_city,
                      color: kButtonPositiveColor,
                    )),
                SizedBox(width: 8.0),
                Expanded(
                  child: Stack(
                    children: [
                      Text(
                        " " + locationData.location,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 20.0,
                        child: Container(
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
