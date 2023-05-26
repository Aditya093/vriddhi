import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';

class BigAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                 child: Image.asset(
                  "assets/images/temp/User_Icon.png",
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
