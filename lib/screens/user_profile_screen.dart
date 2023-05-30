import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/services/Authentication.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? profileimage;
  final ImagePicker picker = ImagePicker();

  //we can upload from gallery and camera
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      profileimage = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          //2 containers in the ratio 2:3
          //1st container ... which is stacked with three containers mainly
          Expanded(
            flex: 3,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kPrimaryAppColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40))),
                  margin: EdgeInsets.only(left: 65, bottom: 50),
                  // child: Text("Vriddhi", style: TextStyle(fontSize: 25),),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 60, left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        FontAwesomeIcons.camera,
                                        color: kButtonPositiveColor,
                                      ),
                                      title: Text(
                                        "Capture from Camera",
                                        style: TextStyle(
                                            color: kButtonPositiveColor,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onTap: () async {
                                        await getImage(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        FontAwesomeIcons.images,
                                        color: kButtonPositiveColor,
                                      ),
                                      title: Text(
                                        "Select from Gallery",
                                        style: TextStyle(
                                            color: kButtonPositiveColor,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onTap: () async {
                                        await getImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        child: ClipOval(
                          child: (profileimage != null)
                              ? Image.file(
                                  File(profileimage!.path),
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                )
                              : Image.asset(
                                  "assets/images/temp/User_Icon.png",
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                ),
                        ),
                        backgroundColor: kButtonPositiveColor,
                        radius: 60,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UserInformation.routeName);
                    },
                    child: UserProfileRectangleCards(
                      leadingIcon: FontAwesomeIcons.addressBook,
                      title: 'User Information',
                    )),
              ],
            ),
          ),
          //2nd container... having other cards
          Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.only(top: 4),
                child: Column(
                  children: [
                    UserProfileRectangleCards(
                      leadingIcon: FontAwesomeIcons.pagelines,
                      title: 'Previous Crops',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PrivacyPolicyScreen.routeName);
                      },
                      child: UserProfileRectangleCards(
                        leadingIcon: FontAwesomeIcons.key,
                        title: 'Privacy Policy',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/terms_of_service');
                      },
                      child: UserProfileRectangleCards(
                        leadingIcon: FontAwesomeIcons.clipboard,
                        title: 'Terms of Service',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AboutUsScreen.routeName);
                      },
                      child: UserProfileRectangleCards(
                        leadingIcon: FontAwesomeIcons.circleInfo,
                        title: 'About Us',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Authentication.signOut(context: context);
                      },
                      child: UserProfileRectangleCards(
                        leadingIcon: FontAwesomeIcons.arrowRightFromBracket,
                        title: 'Logout',
                      ),
                    ),
                    // Spacer(),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'App Version 1.0.1',
                          style: kAppVersionTextTS,
                        )),
                  ]
                      .map((e) => Padding(
                            child: e,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                          ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}

class TermsOfServiceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar('Terms of Service'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Terms of Service content goes here.',
            style: kFormTextFieldLabelStyle.copyWith(fontSize: 18)),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  static const routeName = '/privacy-policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar('Privacy Policy'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Privacy Policy content goes here.',
            style: kFormTextFieldLabelStyle.copyWith(fontSize: 18)),
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar('About Us'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('About Us content goes here.',
            style: kFormTextFieldLabelStyle.copyWith(fontSize: 18)),
      ),
    );
  }
}

class UserInfoData {
  final String name;
  final String email;
  final String location;
  final String imageUrl;
  final String currentCrop;

  UserInfoData({
    required this.name,
    required this.email,
    required this.location,
    required this.imageUrl,
    required this.currentCrop,
  });
}

class UserInformation extends StatelessWidget {
  static const routeName = '/user-information';
  final UserInfoData user = UserInfoData(
      name: 'John Doe',
      email: 'johndoe@example.com',
      location: 'New York, USA',
      imageUrl: 'https://picsum.photos/200/300', // Replace with your image URL
      currentCrop: 'Maize');

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: NetworkImage(user.imageUrl),
                backgroundColor: kButtonPositiveColor,
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
                        " " + user.name,
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
                        " " + user.email,
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
                        " " + user.location,
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
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(
                      FontAwesomeIcons.seedling,
                      color: kButtonPositiveColor,
                    )),
                SizedBox(width: 8.0),
                Expanded(
                  child: Stack(
                    children: [
                      Text(
                        " " + user.currentCrop,
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
          ],
        ),
      ),
    );
  }
}
