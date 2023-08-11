// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_null_comparison, prefer_if_null_operators, no_leading_underscores_for_local_identifiers, unused_field

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/result_screen.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/scb_check_list_ditail_screen.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/question_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen(
      {super.key, required this.title, required this.dataList});
  final String title;
  final List<Map<String, dynamic>> dataList;

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  late PageController _controller;
  int _questionNumber = 1;
  bool _isLocked = false;
  List<List> myAnswer = [];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            Text("Question $_questionNumber/${scbList.length}"),

            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.lightBlueAccent),
                      minHeight: 10,
                      value: _questionNumber / scbList.length,
                    ),
                  ),
                ]),
            const Divider(thickness: 1, color: Colors.grey),
            Expanded(
              child: PageView.builder(
                itemCount: scbList.length,
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final _scbList = scbList[index];
                  return buildQuestion(_scbList);
                },
              ),
            ),
            // _isLocked ? buildElevatedButton() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Column buildQuestion(SCBCheckList scb) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          scb.title,
          style: const TextStyle(fontSize: 25),
        ),
        Text(scb.question),
        Text(scb.question2),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 10,
          decoration: BoxDecoration(
            color: scb.color != null ? scb.color : Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Expanded(
          child: QuestionsWidget(
            question: scb,
            onClickedOption: (option) {
              if (scb.isLocked) {
                return;
              } else {
                setState(() {
                  scb.isLocked = true;
                  scb.selectedOption = option;
                  myAnswer.add([
                    // scb.selectedOption,
                    _questionNumber,
                    scb.selectedOption!.option,
                    scb.selectedOption!.point,
                    "",
                  ]);
                });
                _isLocked = scb.isLocked;
              }
            },
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  onTap: !scb.isLocked
                      ? () {
                          if (1 < _questionNumber) {
                            setState(
                              () {
                                _questionNumber--;
                                myAnswer.removeLast();
                              },
                            );
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInExpo,
                            );
                          }
                        }
                      : () {},
                  text: "戻る",
                  icon: const Icon(
                    Icons.back_hand_rounded,
                    color: white,
                  ),
                  color: !scb.isLocked ? baseColor : baseOpacityColor,
                ),
                ButtonWidget(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return SCBCheckListDetailScreen(
                            text: scb.detail, color: scb.color);
                      },
                    );
                  },
                  text: "詳細",
                  icon: const Icon(
                    Icons.info_outline,
                    color: white,
                  ),
                  color: baseColor,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              onTap: scb.isLocked
                  ? () {
                      setState(() {
                        myAnswer.removeLast();
                        scb.isLocked = false;
                        _isLocked = false;
                      });
                    }
                  : () {},
              text: "リセット",
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: white,
              ),
              color: scb.isLocked ? baseColor : baseOpacityColor,
            ),
            ButtonWidget(
              onTap: scb.isLocked
                  ? () {
                      if (_questionNumber < scbList.length) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInExpo,
                        );
                        setState(() {
                          scb.isLocked = false;
                          _questionNumber++;
                          _isLocked = false;
                        });
                      } else {
                        scb.isLocked = false;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              title: widget.title,
                              myAnswer: myAnswer,
                              dataList: widget.dataList,
                            ),
                          ),
                        );
                      }
                    }
                  : () {},
              text: _questionNumber < scbList.length ? "次へ" : "終了",
              icon: _questionNumber < scbList.length
                  ? const Icon(
                      Icons.navigate_next_outlined,
                      color: white,
                    )
                  : const Icon(
                      Icons.check_circle_outline,
                      color: white,
                    ),
              color: scb.isLocked ? baseColor : baseOpacityColor,
            ),
          ],
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
