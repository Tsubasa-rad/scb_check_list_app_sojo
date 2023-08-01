// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/save_and_share.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:screenshot/screenshot.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  bool switchValue = true;

// OSごとで判定するプロパティも提供されている
  bool isAndroid = Platform.isAndroid;

  final screenshotcontroller = ScreenshotController();

  Color _backgroundColor = baseColor;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              const Spacer(),
            ],
          ),
          // イメージの設定
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Screenshot(
                controller: screenshotcontroller,
                child: Container(
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      Styles.shadowCard,
                    ],
                  ),
                  child: Image(
                    height: size.width * 0.7,
                    image: const AssetImage(
                      "assets/images/scb-transparent.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: "背景色の変更",
                icon: const Icon(
                  Icons.color_lens_outlined,
                  size: 20,
                  color: white,
                ),
                color: blue,
                onTap: _openColorPicker,
                textColor: white,
              ),
              ButtonWidget(
                text: "シェア",
                icon: const Icon(
                  Icons.share,
                  color: white,
                ),
                color: blue,
                textColor: white,
                onTap: () async {
                  final screenshot = await screenshotcontroller.capture();
                  if (screenshot != null) {
                    saveAndShare(screenshot);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('背景色を選択'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _backgroundColor,
              onColorChanged: (Color color) {
                setState(() {
                  _backgroundColor = color;
                });
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('閉じる'),
            ),
          ],
        );
      },
    );
  }
}
