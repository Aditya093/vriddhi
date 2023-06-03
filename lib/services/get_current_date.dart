import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CurrentDate{
  static String getCurrentDateWithDay(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy, EEEE').format(now);
    return formattedDate;
  }
  static String getCurrentDate(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return formattedDate;
  }
}