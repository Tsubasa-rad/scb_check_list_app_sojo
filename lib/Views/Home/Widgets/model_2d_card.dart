
import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class Model2DCard extends StatelessWidget {
  const Model2DCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          color: white,
          gradient: Styles.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        child: Image.asset(
          "assets/images/scb-transparent.png",
          fit: BoxFit.cover, // 画像のスケーリングモード
        ),
      );
  }
}
