import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/text_models.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/Widgets/text_length.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    // デバイスのスクリーンのサイズの取得
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard,
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                "SCBチェックリスト",
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const Text(
                "あなたのプロジェクトをSCB理論で可視化",
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextLength(
                  caption: scbText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
