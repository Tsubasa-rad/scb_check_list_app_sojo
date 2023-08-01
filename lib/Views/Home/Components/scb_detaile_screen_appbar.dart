// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/SCB/scb_detail_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SCBDetailScreenAppBar extends StatelessWidget {
  const SCBDetailScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 50,
        foregroundColor: fontColor,
        shadowColor: white,
        backgroundColor: barColor,
        elevation: 0, // シャドーを無効化
        title: Text(
          "SCB理論について",
          style: Styles.cardHead,
        ),
      ),
      body: SCBDetailScreen(),
    );
  }
}
