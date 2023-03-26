import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';


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
          flex: 2,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryAppColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(40))),
                margin: EdgeInsets.only(left: 65, bottom: 50),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 60,left: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    "Select your Profile Picture"),
                                actions: [
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kButtonPositiveColor, // Background color
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon( // <-- Icon
                                            FontAwesomeIcons.imagePortrait,
                                            size: 24.0,
                                          ),
                                          Text('Upload from Gallery',),
                                          // <-- Text
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                      onPressed: () async {
                                        await getImage(ImageSource.gallery);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child:   CircleAvatar(
                          // child: ClipOval(
                          //   child: (profileimage != null)
                          //       ? Image.file(File(profileimage!.path),fit: BoxFit.cover,height: 150,width: 150,)
                          //       : Image.asset('images/newimage.png'),
                          // ),
                          backgroundColor: kGreyColor,
                          radius: 60,
                        ) ,
                      ),),),
              UserProfileRectangleCards(leadingIcon: FontAwesomeIcons.addressBook,title: 'User Information',),
            ],
          ),
        ),
        //2nd container... having other cards
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(top: 4),
            child: Column(
              children: [
                UserProfileRectangleCards(leadingIcon: FontAwesomeIcons.pagelines,title: 'Previous Crops',),
                UserProfileRectangleCards(leadingIcon: FontAwesomeIcons.key, title: 'Privacy Policy',),
                UserProfileRectangleCards(leadingIcon: FontAwesomeIcons.clipboard, title: 'Terms of Service',),
                UserProfileRectangleCards(leadingIcon: FontAwesomeIcons.circleInfo,title: 'About Us',),
                // Spacer(),
                Align(alignment: Alignment.bottomCenter,child: Text('App Version 1.0.1',style: kAppVersionTextTS,)),
              ].map((e) => Padding(
                child: e,
                padding: const EdgeInsets.symmetric(vertical: 4),
              )).toList(),
            ),
          )
        ),
      ],
    ));
  }
}


