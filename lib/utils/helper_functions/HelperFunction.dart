import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ingenious_5/utils/colors.dart';

class HelperFunction {
  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT, // Duration for which the toast is visible
      gravity: ToastGravity.BOTTOM, // Position of the toast message
      backgroundColor: AppColors.theme["fontColor"].withOpacity(0.7), // Background color of the toast message
        textColor: AppColors.theme["backgroundColor"], // Text color of the toast message
      fontSize: 16.0, // Font size of the toast message
    );
  }
}