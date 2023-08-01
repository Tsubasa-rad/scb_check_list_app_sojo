
import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class ShareSettingColorModel {
  final int number;
  final Color color1, color2;

  ShareSettingColorModel({
    required this.number,
    required this.color1,
    required this.color2,
  });
}

List shareColorModel = [
  ShareSettingColorModel(
    number: 1,
    color1: gradation1,
    color2: gradation2,
  ),
  ShareSettingColorModel(
    number: 2,
    color1: Color.fromARGB(255, 212, 42, 42),
    color2: Color.fromARGB(255, 42, 39, 222),
  ),
  ShareSettingColorModel(
    number: 3,
    color1: Color.fromARGB(255, 166, 255, 23),
    color2: Color.fromARGB(255, 47, 43, 255),
  ),
  ShareSettingColorModel(
    number: 4,
    color1: Color.fromARGB(255, 255, 75, 84),
    color2: Color.fromARGB(255, 0, 255, 51),
  ),
  ShareSettingColorModel(
    number: 5,
    color1: Color.fromARGB(255, 42, 169, 212),
    color2: Color.fromARGB(255, 3, 3, 26),
  ),
  ShareSettingColorModel(
    number: 6,
    color1: Color.fromARGB(255, 77, 252, 19),
    color2: Color.fromARGB(255, 4, 0, 255),
  ),
  ShareSettingColorModel(
    number: 7,
    color1: Color.fromARGB(255, 255, 161, 30),
    color2: Color.fromARGB(255, 38, 255, 107),
  ),
];
