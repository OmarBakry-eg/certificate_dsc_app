import 'package:flutter/material.dart';

class DataModel {
  String name;
  String fontFamily;
  Color textColor;
  num textFontSize;

  DataModel({
    this.name,
    this.fontFamily = "OpenSans",
    this.textColor = Colors.black,
    this.textFontSize = 20.0,
  });
}
