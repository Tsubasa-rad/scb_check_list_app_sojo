// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/scb_check_list_data.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class CheckListCard extends StatelessWidget {
  const CheckListCard({
    super.key,
    required this.dataList,
    required this.size,
    required this.title,
    required this.dateTime,
    required this.point,
    required this.data,
    required this.cardIndex,
  });

  final List dataList;
  final List<Map<String, dynamic>> data;
  final Size size;
  final String title;
  final String dateTime;
  final int point, cardIndex;

  @override
  Widget build(BuildContext context) {
    final String grade;
    final Color color;
    if (point >= 90) {
      grade = '秀';
      color = Colors.green;
    } else if (point >= 80) {
      grade = '優';
      color = Colors.blue;
    } else if (point >= 70) {
      grade = '良';
      color = Colors.orange;
    } else {
      grade = '可';
      color = Colors.red;
    }
    int indexOfSpace = dateTime.indexOf(' ');
    String date =
        indexOfSpace >= 0 ? dateTime.substring(0, indexOfSpace) : dateTime;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SCBCheckListData(
                point: point,
                dataList: dataList,
                title: title,
                dateTime: dateTime,
                data: data,
                cardIndex: cardIndex,
                color: color,
                grade: grade,
              ),
            )),
        child: Container(
          width: size.width - 30,
          decoration: BoxDecoration(
            color: white,
            gradient: Styles.cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard,
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: Styles.cardHead,
                ),
              ),
              Text(
                // "SCBチェックリスト  ${dateTime.year}/${dateTime.month}/${dateTime.day}",
                "SCBチェックリスト  ${date}",
                style: Styles.cardText,
              ),
              const SizedBox(height: 10),
              Text(
                grade,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: color,
                  shadows: [
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
              ),
              Text(
                "${point} ポイント",
                style: Styles.cardText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
