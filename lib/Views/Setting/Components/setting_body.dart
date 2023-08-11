// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:scb_check_list_app_sojo/Models/settings_model.dart';
import 'package:scb_check_list_app_sojo/Models/text_models.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/setting_card_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/Widgets/text_length.dart';
import 'package:scb_check_list_app_sojo/auth_screen.dart';
import 'package:scb_check_list_app_sojo/database/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  late String userName = "";
  void getUserNameFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("userName") ?? "登録されていません";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserNameFromLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                Styles.shadowCard,
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "SCB理論について",
                  style: Styles.cardHead,
                ),
                TextLength(caption: scbShotText),
              ],
            ),
          ),
        ),
        ...List.generate(
          settingModel.length,
          (index) => SettingCardWidget(
            title: settingModel[index].title,
            icon: settingModel[index].icon,
            arrow: settingModel[index].arrow,
            bodyView: settingModel[index].bodyView,
            automatically: settingModel[index].automatically,
          ),
        ),
        ButtonWidget(
          text: "ログアウト",
          icon: Icon(
            Icons.logout_outlined,
            color: black,
          ),
          color: white,
          onTap: () {
            // ログアウトボタンが押された際の処理
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
            );
            logOut();
            final snackBar = SnackBar(content: Text("ログアウト完了"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
        SizedBox(height: 15),
        Center(
          child: Column(
            children: [
              Text(
                "ID: ${userName}",
              ),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final packageInfo = snapshot.data!;
                    return Text('Version: ${packageInfo.version}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
