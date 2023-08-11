// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/check_list_appbar_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Home/Components/scb_detaile_screen_appbar.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class HomeCardModel {
  final String title, subtitle;
  final icon;
  final ontap;
  final String? url, image;
  final Color color1, color2;

  HomeCardModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.ontap,
    required this.url,
    required this.color1,
    required this.color2,
    this.image,
  });
}

final cardModel = [
  HomeCardModel(
    title: 'SCBチェックリスト',
    subtitle: "SCB理論に基づきプロジェクトの評価",
    icon: Icons.fact_check_outlined,
    ontap: CheckListAppBarScreen(),
    url: null,
    color1: baseColor,
    color2: Colors.yellow,
  ),
  HomeCardModel(
    title: 'SCB理論について',
    subtitle: "SCB理論についての説明",
    icon: Icons.lightbulb_circle_outlined,
    ontap: SCBDetailScreenAppBar(),
    url: null,
    color1: Colors.pink,
    color2: gradation2,
  ),
  // HomeCardModel(
  //   title: '崇城大学IoT・AIセンター',
  //   subtitle: "崇城大学IoT・AIセンターのホームページ",
  //   icon: Icons.web_outlined,
  //   ontap: () {
  //     // サイドバーの項目をタップした時の処理
  //     // ここでは設定画面に遷移する処理を追加します。
  //   },
  //   url: "https://www.cis.sojo-u.ac.jp/index.php/iot-ai-center.html",
  //   color1: Color.fromARGB(255, 255, 59, 72),
  //   color2: Colors.lightBlue,
  // ),
  // HomeCardModel(
  //   title: 'SCBラボ',
  //   subtitle: "一般社団法人SCBラボのホームページ",
  //   icon: Icons.web_outlined,
  //   image: "assets/icons/scb_logo.png",
  //   url: "https://scblab.jp/",
  //   color1: Colors.grey,
  //   color2: Colors.lightBlue,
  // ),
];
