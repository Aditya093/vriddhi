import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kPrimaryAppColor = Color(0xff00A896);
const kGreyColor = Color(0xffD9D9D9);
const kNavyBlueColor = Color(0xff003249);
const kDescriptionFontColor = Color(0xff9B9B9B);
const kBottomNavBarColor = Color(0xffccdbdc);
const kSearchBarTextColor = Color(0xff000000);
const kBackgroundColor = Color(0xFFF2F3F4);
const kLightTealCardColor = Color(0xffccdbdc);
const kCardColorSecond = Color(0xffffffff);
const kDangerColor = Color(0xFFc71e1e);


const kProgressBoxTitleTS = TextStyle(
  fontSize: 20,
  color: kNavyBlueColor,
);
const kProgressBoxbottomTS = TextStyle(fontSize: 16, color: kNavyBlueColor);
const kTitleOfInfoCardsTS =
    TextStyle(fontSize: 23, color: kNavyBlueColor, fontWeight: FontWeight.bold);
const kTitleOfWeekCardsTS = TextStyle(
    fontSize: 25,
    color: kNavyBlueColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Catamaran');
const kWeekTitleTS = TextStyle(
  fontSize: 25,
  color: kNavyBlueColor,
  fontFamily: 'Catamaran',
  fontWeight: FontWeight.bold,
);
const kVriddhiAppTitleTS = TextStyle(
  fontSize: 30,
  color: Colors.white,
  decoration: TextDecoration.none,
);
const kAppVersionTextTS = TextStyle(
  color: Color(0xff9B9B9B),
  fontSize: 14,
);
const kUserProfileCardsTitleTS = TextStyle(
  fontSize: 18,
);
const kSubtitleTS = TextStyle(color: kDescriptionFontColor, fontSize: 12);
const kLoader = SpinKitDoubleBounce(
  color: kPrimaryAppColor,
  size: 100,
);

const kLoaderForGuide = SpinKitDoubleBounce(
  color: Color(0xff88D197),
  size: 100,
);

const kUsernameTextStyleInUP = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
//--------Zeels constants
const kPrimaryAppbarColor = Color(0xFF00A896);
const kPrimaryGreenColor = Color(0xFF06D6A0);
const kHeadingTextColor = Color(0xFF003249);
const kSecondaryHeadingTextColor = Color(0xFF9B9B9B);
// const kBackgroundColor = Color(0xFFCCDBDC);
const kButtonPositiveColor = Color(0xFF073B56);
const kButtonNegativeColor = Color(0xFFffffff);

const kSmallAppBarTitleTS = TextStyle(
  color: Colors.white,
  fontSize: 22,
);
const kFormTextFieldLabelStyle = TextStyle(
  fontFamily: "Jaldi",
  fontSize: 20.0,
  color: kHeadingTextColor,
  fontWeight: FontWeight.w500,
  height: 2
);

const kFormTextFieldStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: InputBorder.none,
  hintText: "",
);

const kFormPrimaryHeadingStyle = TextStyle(
  fontFamily: "Jaldi",
  fontWeight: FontWeight.w900,
  fontSize: 28.0,
  color: kHeadingTextColor,
  height: 2
);

const kFormSecondaryHeadingStyle = TextStyle(
  fontFamily: "Catamaran",
  fontSize: 15.0,
  color: Color(0xFF9B9B9B),
  height: 2
);

const kFormLabelTextFieldStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: InputBorder.none,
  hintText: "",
  hintStyle: TextStyle(color: kSecondaryHeadingTextColor),
  labelText: "",
  labelStyle: TextStyle(color: kButtonPositiveColor),
);

const kGreySubtitleTS = TextStyle(
  fontFamily: "Catamaran",
  fontSize: 15.0,
  color: Color(0xFF9B9B9B),
  height: 2
);

