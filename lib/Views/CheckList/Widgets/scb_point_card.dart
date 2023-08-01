// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
// import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/scb_animated_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SCBPointCard extends StatelessWidget {
  const SCBPointCard({
    super.key,
    required this.size,
    required this.currentTime,
    required this.title,
    required this.point,
    required this.grade,
    required this.color,
    this.color1 = gradation1,
    this.color2 = gradation2,
  });

  final Size size;
  final String currentTime;
  // final SCBAnimatedCard widget;
  final String title;
  final int point;
  final String grade;
  final Color color;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 50,
      height: size.height / 2.5,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            color1.withOpacity(0.6),
            color2.withOpacity(0.6),
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SCBチェックリスト",
            style: Styles.head,
          ),
          Text("${title}"),
          Text(currentTime),
          const SizedBox(height: 20),
          Text(
            "${point}",
            style: const TextStyle(fontSize: 70),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "評価",
                style: Styles.head,
              ),
              const SizedBox(width: 15),
              Text(
                grade,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
