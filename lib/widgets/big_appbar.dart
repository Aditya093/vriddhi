import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/user_data.dart';
import 'dart:convert';

class BigAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    return Container(
      alignment: Alignment.topCenter,
      height: 170,
      decoration: BoxDecoration(
        color: kPrimaryAppColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.only(left: 15, right: 20, ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Logo
          Image.asset(
            'assets/images/logo/logo.png',
            height: 120,
            width: 120,
          ),
          //User Circle - floating action button
          Spacer(),
          InkWell(
            onTap: (){},
            child: CircleAvatar(
              child: ClipOval(
                child: userData.photoUrl.isNotEmpty
                    ? Image.memory(
                  base64Decode(userData.photoUrl),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  "assets/images/temp/User_Icon.jpg",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
              radius: 27,
              backgroundColor: kButtonPositiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
