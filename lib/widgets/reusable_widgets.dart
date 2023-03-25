import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';

class ReusableWidgets {
  static AppBar smallAppBar(String title){
    return AppBar(
      backgroundColor: kPrimaryAppbarColor,
      centerTitle: true,
      title: Text(title,style: kSmallAppBarTitleTS,) ,
      leading: Image.asset(
        'assets/images/logo/logo_primary.png',
        // fit: BoxFit.contain,
        color: kPrimaryGreenColor,
        height: 10,
        width: 10,
      ),
      // leadingWidth: 80,
      actions: [
        Icon(
          Icons.add_alert_sharp,
          color: kPrimaryGreenColor,
          size: 30.0,
        ),
        SizedBox(width: 10.0),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),),
      ),
    );
  }
}
