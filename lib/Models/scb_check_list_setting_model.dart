// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/check_list_appbar_screen.dart';

class scbSettingModel {
  final String title, subTitle, button;
  final bool alert;
  final icon;
  final onTap;

  scbSettingModel({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.button,
    this.alert = false,
    this.onTap,
  });
}

final scbSetting = [
  scbSettingModel(
    title: "保存データ",
    subTitle: "現在保存されているデータへアクセスします",
    icon: Icons.next_plan,
    button: "アクセス",
    onTap: CheckListAppBarScreen(),
  ),
  // scbSettingModel(
  //   title: "保存データの送信",
  //   subTitle: "現在保存されているデータを送信することができます",
  //   icon: Icons.share,
  //   button: "アクセス",
  //   onTap: CheckListAppBarScreen(),
  // ),
  scbSettingModel(
    title: "保存データの削除",
    subTitle: "現在保存されているデータの全てを削除します",
    icon: Icons.delete,
    button: "削除",
    alert: true,
  ),
];
