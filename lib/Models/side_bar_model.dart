// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/check_list_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Home/home_screen.dart';
// import 'package:scb_check_list_app_sojo/Views/Notifications/notifications_screen.dart';
import 'package:scb_check_list_app_sojo/Views/SCB/scb_detail_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/setting_screen.dart';

List<Widget> pageList = [
  HomeScreen(),
  CheckListScreen(),
  SCBDetailScreen(),
  // NotificationsScreen(),
  SettingScreen(),
];

const List<NavigationRailDestination> destinations = [
  NavigationRailDestination(
    icon: Icon(Icons.home),
    label: Text('Home'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.fact_check_outlined),
    label: Text('SCBチェックリスト'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.subject_rounded),
    label: Text('SCB理論について'),
  ),
  // NavigationRailDestination(
  //   icon: Icon(Icons.campaign),
  //   label: Text('お知らせ'),
  // ),
  NavigationRailDestination(
    icon: Icon(Icons.settings),
    label: Text('設定'),
  ),
];
