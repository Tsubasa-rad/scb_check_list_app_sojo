// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/check_list_title_screen.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/check_list_body.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/database/data_storage.dart';

class CheckListAppBarScreen extends StatefulWidget {
  const CheckListAppBarScreen({super.key});

  @override
  State<CheckListAppBarScreen> createState() => _CheckListAppBarScreenState();
}

class _CheckListAppBarScreenState extends State<CheckListAppBarScreen> {
  final DataStorage dataStorage = DataStorage();

  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    loadDataList();
  }

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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 50,
        foregroundColor: fontColor,
        shadowColor: white,
        backgroundColor: barColor,
        elevation: 0, // シャドーを無効化
        title: Text(
          "SCB理論",
          style: Styles.cardHead,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return deleteAlert(context);
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: black,
            ),
          )
        ],
      ),
      body: CheckListBody(
        dataList: dataList,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: baseColor,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckListTitleScreen(dataList: dataList),
              fullscreenDialog: true,
            )),
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  Center deleteAlert(BuildContext context) {
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
              "すべてのデータが削除されますが、\nよろしいですか？",
              style: Styles.alertText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: "キャンセル",
                  icon: Icon(
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
                  text: "消去",
                  icon: Icon(
                    Icons.delete_outline,
                    color: white,
                  ),
                  color: Colors.red,
                  textColor: white,
                  onTap: deleteAllData,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
