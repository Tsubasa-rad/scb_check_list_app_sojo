
// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Views/ShareSetting/share_setting_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class ShareCardSpiral extends StatelessWidget {
  const ShareCardSpiral({
    super.key,
    required this.width,
    required this.color1,
    required this.color2,
    required this.widget,
    required this.grade,
    required this.color,
  });

  final width;
  final Color color1;
  final Color color2;
  final ShareSettingScreen widget;
  final String grade;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
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
      ),
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              painter: SpiralTextPainter(widget),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SCBチェックリスト",
                style: Styles.head,
              ),
              Text(
                "${widget.title}",
                style: Styles.cardHead,
              ),
              const SizedBox(height: 20),
              Text(
                "${widget.point}",
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
        ],
      ),
    );
  }
}

class SpiralTextPainter extends CustomPainter {
  final ShareSettingScreen widget;
  final double radius;
  final double anglePerText;

  SpiralTextPainter(this.widget)
      : radius = 140,
        anglePerText = -2 * pi / scbList.length;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < scbList.length; i++) {
      final angle = i * anglePerText;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      final textPainter = TextPainter(
        text: TextSpan(
          text: scbList[i].question,
          // text: widget.dataList[i][1],
          style:
              TextStyle(color: white, fontSize: 7, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
