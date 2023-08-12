// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/check_box_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class CheckListTitleScreen extends StatefulWidget {
  final List<Map<String, dynamic>> dataList;
  const CheckListTitleScreen({super.key, required this.dataList});

  @override
  State<CheckListTitleScreen> createState() => _CheckListTitleScreenState();
}

class _CheckListTitleScreenState extends State<CheckListTitleScreen> {
  String _inputText = '';
  String selectedItem = 'SCBチェックリスト';
  List<String> item = ['SCBチェックリスト', 'テキストアンケート']; // 初期選択項目

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "分析する対象となる活動のタイトルを設定してください",
              style: Styles.cardText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // controller: model.usernameController,
              decoration: InputDecoration(
                hintText: 'タイトル',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (text) {
                _inputText = text;
              },
              maxLines: 1,
              maxLength: 20,
            ),
          ),
          Text("分析の種類の選択"),
          Container(
            child: Wrap(
              runSpacing: 15,
              spacing: 15,
              children: item.map((tag) {
                return InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () {
                    setState(() {
                      selectedItem = tag;
                    });
                  },
                  child: AnimatedContainer(
                      duration: Duration(microseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      decoration: BoxDecoration(
                        color: tag == selectedItem ? baseColor : white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                        border: Border.all(width: 2, color: baseDarkColor),
                      ),
                      child: Text(tag)),
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showAlertDialog(context, _inputText);
              },
              child: Text("アンケートを開始する")),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          content: text != ""
              ? Text('このタイトルで保存されます\n${selectedItem}でアンケートを開始しますか？')
              : Text("タイトルを設定してください"),
          actions: [
            ButtonWidget(
              text: "閉じる",
              icon: Icon(
                Icons.cancel,
                color: white,
              ),
              color: Colors.red,
              textColor: white,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            text != ""
                ? ButtonWidget(
                    text: "アンケートを開始する",
                    icon: Icon(
                      Icons.start_outlined,
                      color: white,
                    ),
                    color: blue,
                    textColor: white,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckBoxScreen(
                          title: _inputText,
                          dataList: widget.dataList,
                          selectedItem: selectedItem,
                        ),
                        fullscreenDialog: true,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
