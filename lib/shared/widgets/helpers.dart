import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/constants/pallete.dart';
import 'package:sizer/sizer.dart';

toast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Pallete.primary,
      textColor: Colors.white,
      fontSize: 16.0);
}
