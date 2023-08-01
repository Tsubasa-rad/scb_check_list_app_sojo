// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/database/data_storage.dart';

class SettingButton extends StatefulWidget {
  final String title, subTitle, button;
  final bool alert, fullscreen;
  final icon;
  final onTap;
  const SettingButton({
    super.key,
    required this.title,
    required this.subTitle,
    required this.button,
    required this.icon,
    this.onTap,
    this.alert = false,
    this.fullscreen = true,
  });

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  final DataStorage dataStorage = DataStorage();

  List<Map<String, dynamic>> dataList = [];

  Future<void> loadDataList() async {
    final List<Map<String, dynamic>> loadedData = await dataStorage.loadData();
    setState(() {
      dataList = loadedData;
    });
  }

  Future<void> deleteAllData() async {
    await dataStorage.deleteAllData();
    await loadDataList();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        child: Column(
          children: [
            Text(
              widget.title,
              style: Styles.cardHead,
            ),
            Text(widget.subTitle),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ButtonWidget(
                text: widget.button,
                icon: Icon(
                  widget.icon,
                ),
                onTap: widget.alert
                    ? () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Alert(
                              context,
                              "すべてのデータが削除されますが、\nよろしいですか？",
                              "削除",
                              () {
                                deleteAllData();
                              },
                            );
                          },
                        );
                      }
                    : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => widget.onTap,
                            fullscreenDialog: widget.fullscreen,
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center Alert(BuildContext context, String text, String onTapText, onTap) {
    return Center(
      child: Container(
        height: 200,
        width: 280,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Styles.alertText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: "キャンセル",
                  icon: const Icon(
                    Icons.cancel,
                    color: white,
                  ),
                  color: blue,
                  textColor: white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ButtonWidget(
                  text: onTapText,
                  icon: const Icon(
                    Icons.delete_outline,
                    color: white,
                  ),
                  color: Colors.red,
                  textColor: white,
                  onTap: onTap,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
