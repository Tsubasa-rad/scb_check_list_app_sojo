// ignore_for_file: unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/side_bar_model.dart';
import 'package:scb_check_list_app_sojo/Widgets/share_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width / 7;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: barColor,
        foregroundColor: Colors.black,
        elevation: 1, // シャドー
        title: Text(
          "SCB KUMAMOTO DAO",
          style: Styles.textStyle,
        ),
      ),
      body: Row(
        children: [
          Container(
            width: sizeWidth,
            decoration: BoxDecoration(
              boxShadow: [
                Styles.shadowCard,
              ],
            ),
            child: NavigationRail(
              backgroundColor: barColor,
              // labelType: NavigationRailLabelType.selected,
              trailing: Column(
                children: [
                  SizedBox(height: size.height / 6),
                  const Divider(),
                  // shareボタン
                  GestureDetector(
                    onTap: () {
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
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.ios_share_outlined,
                        color: fontColor,
                      ),
                    ),
                  ),
                ],
              ),
              selectedIconTheme: const IconThemeData(color: baseColor),
              destinations: destinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            width: size.width - sizeWidth,
            child: pageList[selectedIndex],
          )
        ],
      ),
    );
  }
}
