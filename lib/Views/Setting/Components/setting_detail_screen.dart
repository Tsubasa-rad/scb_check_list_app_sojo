// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SettingDetailScreen extends StatelessWidget {
  final String title;
  final bodyView;
  final bool automatically;
  const SettingDetailScreen({
    super.key,
    required this.title,
    this.bodyView,
    this.automatically = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 戻るボタンを非表示にする
        toolbarHeight: 50,
        foregroundColor: fontColor,
        shadowColor: white,
        backgroundColor: barColor,
        elevation: 0, // シャドーを無効化
        title: Text(
          title,
          style: Styles.cardHead,
        ),
        leading: IconButton(
          onPressed: automatically
              ? () {
                  Navigator.pop(context);
                }
              : () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Alert(
                        context,
                        "保存されていませんが、\nよろしいですか？",
                        "戻る",
                        () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/')); // 最初のページまで戻る
                        },
                      );
                    },
                  );
                },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          automatically
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.save_alt,
                  ),
                )
        ],
      ),
      body: bodyView,
    );
  }

  Center Alert(BuildContext context, String text, String onTapText, onTap) {
    return Center(
      child: Container(
        height: 200,
        width: 280,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Styles.alertText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: onTapText,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                  ),
                  color: blue,
                  textColor: white,
                  onTap: onTap,
                ),
                ButtonWidget(
                  text: "キャンセル",
                  icon: const Icon(
                    Icons.cancel,
                    color: white,
                  ),
                  color: blue,
                  textColor: white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
