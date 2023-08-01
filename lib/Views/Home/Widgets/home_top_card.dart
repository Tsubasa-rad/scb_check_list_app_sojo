// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/text_models.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/check_list_appbar_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Home/Widgets/model_2d_card.dart';
import 'package:scb_check_list_app_sojo/Views/Home/Widgets/model_3d_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class HomeTopCard extends StatefulWidget {
  const HomeTopCard({super.key});

  @override
  State<HomeTopCard> createState() => _HomeTopCardState();
}

class _HomeTopCardState extends State<HomeTopCard> {
  bool switchValue = false;

// OSごとで判定するプロパティも提供されている
  bool isIOS = Platform.isIOS;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckListAppBarScreen(),
            )),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: white,
            gradient: Styles.cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard,
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SCBチェックリスト",
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    BoxShadow(
                      color: white,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              isIOS ? Model3DCard(switchValue: switchValue) : Model2DCard(),
              isIOS ? selectCard() : SizedBox(height: 20),
              Text(
                homecard,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row selectCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              switchValue = !switchValue;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: gradation2,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              switchValue ? "3D" : "画像",
              style: Styles.cardTextSmall,
            ),
          ),
        ),
      ],
    );
  }
}
