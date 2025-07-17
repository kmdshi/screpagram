import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(color: textColor)),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}