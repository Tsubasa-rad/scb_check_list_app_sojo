// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/3DModel/model_3d_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/setting_detail_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/full_screen_video-player.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/setting_button.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/share_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class IconModelSetting extends StatefulWidget {
  const IconModelSetting({super.key});

  @override
  State<IconModelSetting> createState() => _IconModelSettingState();
}

class _IconModelSettingState extends State<IconModelSetting> {
// OSごとで判定するプロパティも提供されている
  bool isIOS = Platform.isIOS;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (isIOS)
          SettingButton(
            title: "3Dモデルについての設定",
            subTitle: "3Dモデルを自由に動かすことができます",
            button: "3Dモデル",
            icon: Icons.burst_mode_outlined,
            onTap: Model3DScreen(),
            fullscreen: false,
          ),
        iconCard(
          context,
          "SCB公式アイコン",
          "SCB公式画像",
          Icon(
            Icons.video_collection_sharp,
          ),
          () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return const ShareScreen();
              },
            );
          },
        ),
        iconCard(
          context,
          "SCB公式アイコン",
          "SCB公式のアイコンのアニメーション",
          Icon(
            Icons.video_collection_sharp,
          ),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullScreenVideoPlayer(
                url: "https://firebasestorage.googleapis.com/v0/b/scb-check-list-app.appspot.com/o/videos%2Fscb_icon_video.mp4?alt=media&token=ce858467-59b3-44df-a2d4-3d41a5935e92",
                boolURL: true,
              ),
              fullscreenDialog: true,
            ),
          ),
        ),
      ],
    );
  }

  Padding iconCard(
      BuildContext context, String title, String subtitle, Icon icon, onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Styles.cardHead,
            ),
            Text(subtitle),
            const SizedBox(height: 10),
            ButtonWidget(text: title, icon: icon, onTap: onTap),
          ],
        ),
      ),
    );
  }
}
