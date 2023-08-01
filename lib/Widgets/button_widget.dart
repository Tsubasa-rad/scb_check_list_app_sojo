// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class ButtonWidget extends StatelessWidget {
  final onTap;
  final String text;
  final Icon icon;
  final Color color, textColor;
  const ButtonWidget({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
    this.color = baseColor,
    this.textColor = black,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
