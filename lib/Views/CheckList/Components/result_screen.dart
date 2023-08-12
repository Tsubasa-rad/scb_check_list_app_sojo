// ignore_for_file: sort_child_properties_last, prefer_const_constructors_in_immutables, no_logic_in_create_state, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Models/scb_text_model.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/check_box.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/scb_animated_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/database/data_storage.dart';
import 'package:screenshot/screenshot.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {super.key,
      required this.title,
      required this.myAnswer,
      required this.dataList,
      required this.selectedItem});
  final String title;
  final List<Map<String, dynamic>> dataList;

  final List<List> myAnswer;
  final String selectedItem;

  @override
  State<ResultScreen> createState() => _ResultScreenState(dataList);
}

class _ResultScreenState extends State<ResultScreen> {
  final List<List> MySCBList = [];
  final DataStorage dataStorage = DataStorage();
  final List<Map<String, dynamic>> dataList;
  int total = 0;

  _ResultScreenState(this.dataList);

  Future<void> onSaveButtonPressed() async {
    final String title = widget.title;
    final String dataCategory =
        widget.selectedItem == "SCBチェックリスト" ? "scbCheckList" : "textScbList";

    if (title.isNotEmpty && total > 0) {
      final Map<String, dynamic> newData = {
        'id': UniqueKey().toString(),
        'title': title,
        'point': total,
        'time': DateTime.now().toString(),
        'category': dataCategory,
        'list': widget.myAnswer,
      };
      dataList.add(newData);
      await dataStorage.saveData(dataList);

      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  calculateTotal(dataList) {
    List questionnaireData =
        widget.selectedItem == 'SCBチェックリスト' ? scbList : textScbList;
    for (var i = 0; i < widget.myAnswer.length; i++) {
      final int point = widget.myAnswer[i][2];
      total += point;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    calculateTotal(dataList);
  }

  @override
  Widget build(BuildContext context) {
    final screenshotcontroller = ScreenshotController();
    final size = MediaQuery.of(context).size;
    final currentTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: gradation1.withOpacity(0.6),
        foregroundColor: black,
        elevation: 0, // シャドーを無効化
        leadingWidth: 90,
        leading: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "今回行ったSCBチェックリストは、\n保存されていませんが、\nよろしいですか？",
                    style: Styles.alertText,
                  ),
                  content: Text(
                    "保存しない場合は、終了を押してください\n保存する場合は、保存を押してください",
                    style: Styles.cardTextSmall,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          text: "終了",
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: white,
                          ),
                          onTap: () {
                            Navigator.popUntil(
                                context, ModalRoute.withName('/'));
                          },
                          color: Colors.red,
                        ),
                        ButtonWidget(
                          text: "保存",
                          icon: Icon(
                            Icons.save_alt_outlined,
                            color: white,
                          ),
                          onTap: onSaveButtonPressed,
                          color: blue,
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          },
          child: Text(
            "キャンセル",
            style: TextStyle(color: white),
          ),
        ),
        actions: [
          ButtonWidget(
            text: "保存",
            icon: Icon(
              Icons.save_alt_outlined,
              color: white,
            ),
            onTap: onSaveButtonPressed,
          ),
        ],
        title: Text(
          "合計得点${total}",
          style: Styles.head,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: white,
          gradient: Styles.cardColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(10),
                child: SCBAnimatedCard(
                  point: total,
                  title: widget.title,
                  date: currentTime,
                ),
              ),
              SizedBox(height: 30),
              Screenshot(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ...List.generate(
                          widget.myAnswer.length,
                          (index) => CheckBox(
                            size: size,
                            color: scbList[index].color,
                            point: widget.myAnswer[index][2],
                            index: index,
                            title: scbList[index].question,
                            title2: scbList[index].question2,
                            answer: widget.myAnswer[index][1],
                            data: dataList, cardIndex: index, dataBool: false,
                            // answer: scbList[index]
                            //     .selectedOption!
                            //     .option //myAnswer[index][3],
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller: screenshotcontroller),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
