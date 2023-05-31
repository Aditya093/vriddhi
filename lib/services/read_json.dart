import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class ReadJson{
  static Future<Map<dynamic,dynamic>> readJson(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await jsonDecode(response);
    return data;
  }
}