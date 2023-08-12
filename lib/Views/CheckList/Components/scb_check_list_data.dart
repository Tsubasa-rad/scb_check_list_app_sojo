// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Models/scb_text_model.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/check_box.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/scb_animated_card.dart';
import 'package:scb_check_list_app_sojo/Views/ShareSetting/share_setting_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SCBCheckListData extends StatelessWidget {
  const SCBCheckListData({
    super.key,
    required this.point,
    required this.dataList,
    required this.title,
    required this.dateTime,
    required this.data,
    required this.cardIndex,
    required this.grade,
    required this.color,
  });

  final int point, cardIndex;
  final List dataList;
  final List<Map<String, dynamic>> data;
  final String title;
  final String dateTime;

  final String grade;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime date = DateTime.parse(dateTime);
    final String itemData = data[cardIndex]['category'];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: black,
        backgroundColor: gradation1.withOpacity(0.6),
        elevation: 0, // シャドーを無効化
        toolbarHeight: 40,
        title: Text("合計 ${point} ポイント"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShareSettingScreen(
                  point: point,
                  dataList: dataList,
                  title: title,
                  date: date,
                  color: color,
                  grade: grade,
                  data: data,
                  cardIndex: cardIndex,
                ),
                fullscreenDialog: true,
              ),
            ),
            icon: Icon(
              Icons.ios_share_rounded,
            ),
          )
        ],
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          color: white,
          gradient: Styles.cardColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: SCBAnimatedCard(
                  point: point,
                  title: title,
                  date: date,
                ),
              ),
              ...List.generate(
                dataList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CheckBox(
                    size: size,
                    color: itemData == 'scbCheckList' ? scbList[index].color : textScbList[index].color,
                    point: dataList[index][2],
                    index: index,
                    title: itemData == 'scbCheckList' ? scbList[index].question : textScbList[index].question,
                    title2: itemData == 'scbCheckList' ? scbList[index].question2 : textScbList[index].question2,
                    answer: dataList[index]
                        [1], //scbList[index].selectedOption!.option,
                    data: data,
                    cardIndex: cardIndex,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
