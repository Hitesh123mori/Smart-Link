import 'package:flutter/material.dart';

hexStringToColors(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}


class AppColors {
  static Map theme = themes["theme1"];

  static Map themes = {
    "theme1": {
      "primaryColor":hexStringToColors("#609966"),
      "secondaryColor" :hexStringToColors("#9DC08B"),
      "backgroundColor":hexStringToColors("#FFFFFF"),
      "fontColor" :hexStringToColors("40513B"),
    },

  };


}