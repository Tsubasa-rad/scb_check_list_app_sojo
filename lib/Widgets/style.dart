// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const Color white = Color.fromARGB(255, 255, 255, 255);
const Color black = Color.fromARGB(255, 0, 0, 0);
const Color blackGray = Color.fromARGB(255, 50, 50, 50);
const Color whiteBlack = Color.fromARGB(255, 198, 196, 196);
const Color fontColor = Color.fromARGB(255, 0, 0, 0);
const Color baseColor = Color.fromARGB(255, 39, 255, 129);
const Color baseDarkColor = Color.fromARGB(255, 25, 154, 79);
const Color baseOpacityColor = Color.fromARGB(255, 104, 206, 147);
const Color backgroundColor = Color.fromARGB(255, 227, 228, 229);
const Color barColor = Color.fromARGB(255, 255, 255, 255);

const Color gradation1 = Color.fromARGB(255, 132, 107, 255);
const Color gradation2 = Color.fromARGB(255, 47, 255, 155);
const Color blue = Color.fromARGB(255, 47, 158, 255);

bool isDarkMode(BuildContext context) {
  final Brightness brightness = MediaQuery.platformBrightnessOf(context);
  return brightness == Brightness.dark;
}

class Styles {
  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: fontColor, fontWeight: FontWeight.w500);
  static TextStyle head =
      TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle cardHead =
      TextStyle(fontSize: 25, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle cardText =
      TextStyle(fontSize: 15, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle cardTextNormal =
      TextStyle(fontSize: 14, color: fontColor, fontWeight: FontWeight.normal);
  static TextStyle cardTextSmall =
      TextStyle(fontSize: 10, color: fontColor, fontWeight: FontWeight.normal);
  static TextStyle alertText =
      TextStyle(fontSize: 15, color: black, fontWeight: FontWeight.bold);
  static TextStyle buttonText = TextStyle(
      fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold);

  static LinearGradient cardColor = LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [
        gradation1.withOpacity(0.6),
        gradation2.withOpacity(0.6),
      ],
      stops: const [
        0.0,
        1.0,
      ]);

  static BoxShadow shadowCard = BoxShadow(
    color: whiteBlack, // シャドウの色
    spreadRadius: 2, // シャドウの拡がり具合
    blurRadius: 5, // シャドウのぼかし具合
    offset: Offset(0, 3), // シャドウの位置
  );
  static BoxShadow shadowCard2 = BoxShadow(
    color: white, // シャドウの色
    spreadRadius: 3, // シャドウの拡がり具合
    blurRadius: 5, // シャドウのぼかし具合
    offset: Offset(0, 3), // シャドウの位置
  );
  static BoxShadow shadowCardBlue = BoxShadow(
    color: blue, // シャドウの色
    spreadRadius: 3, // シャドウの拡がり具合
    blurRadius: 5, // シャドウのぼかし具合
    offset: Offset(0, 3), // シャドウの位置
  );
}
