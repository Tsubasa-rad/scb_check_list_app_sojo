// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/scb_check_list_ditail_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/database/data_storage.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
    required this.size,
    required this.color,
    required this.point,
    required this.index,
    required this.title,
    required this.title2,
    required this.answer,
    required this.data,
    required this.cardIndex,
    this.dataBool = true,
  });

  final Size size;
  final Color color;
  final int point, index, cardIndex;
  final String title, title2, answer;
  final List<Map<String, dynamic>> data;
  final bool dataBool;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  final DataStorage dataStorage = DataStorage();
  // List<Map<String, dynamic>> dataList;

  TextEditingController textController = TextEditingController();

  Future<void> editDataItem(String id) async {
    final String newData = textController.text;
    widget.data[widget.cardIndex]['list'][widget.index][3] = newData;
    await dataStorage.saveData(widget.data);
    setState(() {
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final int cardComment = 3;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
                  text: scbList[widget.index].detail, color: widget.color);
            },
          );
        },
        child: Container(
          width: widget.size.width - 30,
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard2,
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "問 ${widget.index + 1}",
                    style: Styles.cardText,
                  ),
                  if (widget.dataBool)
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EditAlert(context, widget.index);
                            });
                      },
                      icon: Icon(
                        Icons.edit_document,
                        size: 20,
                      ),
                    )
                ],
              ),
              Text(
                "  ${widget.title}",
                style: Styles.cardText,
              ),
              Text(
                "  ${widget.title2}",
                style: Styles.cardText,
              ),
              const Text("アンサー"),
              Text(
                "  ${widget.answer}",
                style: Styles.cardText,
              ),
              const Text("ポイント"),
              Text(
                "  ${widget.point}",
                style: Styles.cardText,
              ),
              // コメントの設定
              if (widget.dataBool)
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditAlert(context, widget.index);
                        });
                  },
                  child: widget.data[widget.cardIndex]['list'][widget.index]
                              [cardComment] !=
                          ""
                      ? Container(
                          width: widget.size.width,
                          decoration: BoxDecoration(
                            color: widget.color.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              Styles.shadowCard2,
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("コメント"),
                              SizedBox(height: 10),
                              Text(
                                "${widget.data[widget.cardIndex]['list'][widget.index][3]}",
                                style: Styles.cardText,
                              ),
                            ],
                          ),
                        )
                      : Text("コメントなし"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog EditAlert(BuildContext context, int index) {
    textController.text = widget.data[widget.cardIndex]['list'][index]
        [3]; // 保存されたテキストを編集用コントローラーにセット
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('コメントを残す...'),
          IconButton(
            onPressed: () {
              // textController.text = ""; // 保存されたテキストを空文字列に設定
              textController.clear();
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              color: blue,
            ),
          ),
        ],
      ),
      content: TextField(
        // controller: model.usernameController,
        decoration: InputDecoration(
          hintText: 'コメントを編集する',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        controller: textController,
        maxLines: 10,
        maxLength: 300,
      ),
      actions: [
        TextButton(
          onPressed: () {
            textController.clear();
            // refreshDataList;
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            editDataItem(widget.data[widget.cardIndex]['id']);
            // refreshDataList;
            Navigator.pop(context);
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}
