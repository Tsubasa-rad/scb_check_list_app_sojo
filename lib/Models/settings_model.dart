// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/help_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/icon_model_setting.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/references_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/scb_check_list_setting.dart';

class SettingModel {
  final String title;
  final Icon icon;
  final bool arrow, automatically;
  final bodyView;

  SettingModel({
    required this.title,
    required this.icon,
    this.bodyView,
    this.arrow = true,
    this.automatically = true,
  });
}

final settingModel = [
  SettingModel(
      title: "操作方法",
      icon: Icon(Icons.help_center_outlined),
      bodyView: HelpScreen()),

  SettingModel(
    title: "アイコン設定",
    icon: Icon(Icons.image_rounded),
    bodyView: IconModelSetting(),
  ),
  // SettingModel(
  //   title: "通知",
  //   icon: Icon(Icons.notifications),
  //   bodyView: NotificationsSettingScreen(),
  //   automatically: false,
  // ),
  SettingModel(
      title: "SCBチェックリスト",
      icon: Icon(Icons.playlist_add_check_circle_sharp),
      bodyView: SCBCheckListSetting()),
  SettingModel(
    title: "参考文献",
    icon: Icon(Icons.room_preferences),
    bodyView: ReferencesScreen(),
  ),
];
