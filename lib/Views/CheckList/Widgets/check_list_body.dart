// ignore_for_file: no_logic_in_create_state, prefer_is_empty, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/text_models.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/check_list_card.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/detail_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/database/data_storage.dart';

class CheckListBody extends StatefulWidget {
  final List<Map<String, dynamic>> dataList;
  const CheckListBody({super.key, required this.dataList});

  @override
  State<CheckListBody> createState() => _CheckListBodyState(dataList);
}

class _CheckListBodyState extends State<CheckListBody> {
  final DataStorage dataStorage = DataStorage();
  List<Map<String, dynamic>> dataList;
  _CheckListBodyState(this.dataList);

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

  Future<void> refreshDataList() async {
    await loadDataList();
  }

  Future<void> deleteDataItem(String id) async {
    await dataStorage.deleteData(id);
    await loadDataList();
  }

  TextEditingController textController = TextEditingController();

  Future<void> editDataItem(String id) async {
    final String newData = textController.text;
    if (newData.isNotEmpty) {
      await dataStorage.editData(id, newData);
      await loadDataList();
      setState(() {
        textController.clear();
      });
    }
  }

  String selectedItem = 'すべて';
  List<String> item = ['すべて','SCBチェックリスト', 'テキストアンケート']; // 初期選択項目

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String dataCategory =
        selectedItem == "SCBチェックリスト" ? "scbCheckList" : "textScbList";
    return RefreshIndicator(
      onRefresh: refreshDataList,
      child: ListView(
        children: [
          const SizedBox(height: 10),
          const DetailCard(),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  Styles.shadowCard,
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text("カテゴリー選択"),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      runSpacing: 5,
                      spacing: 7,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              decoration: BoxDecoration(
                                color: tag == selectedItem ? baseColor : white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                                border:
                                    Border.all(width: 2, color: baseDarkColor),
                              ),
                              child: Text(tag)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          dataList.length != 0
              ? Column(
                  children: [
                    ...List.generate(
                      dataList.length,
                      (index) => selectedItem != "すべて"
                          ? dataList[index]['category'] == dataCategory
                              ? cardDismissible(context, index, size)
                              : SizedBox()
                          : cardDismissible(context, index, size),
                    ),
                  ],
                )
              : notCardData(size),
        ],
      ),
    );
  }

  Padding notCardData(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
          children: [
            const Text(
              "保存されていません",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            Text(
              notCard,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  Dismissible cardDismissible(BuildContext context, int index, Size size) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        // カードがスワイプされたときの処理を実行
        if (direction == DismissDirection.startToEnd) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return EditAlert(context, index);
              });
        } else if (direction == DismissDirection.endToStart) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertBox(
                    context, index, "選択された項目のみ削除されます。復元はできません\nそれでもよろしいですか？"),
              );
            },
          );
        }
      },
      background: Container(
        color: Colors.green,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.edit,
            color: white,
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: white,
          ),
        ),
      ),
      child: CheckListCard(
        size: size,
        title: "${dataList[index]['title']}",
        dateTime: "${dataList[index]['time']}",
        point: dataList[index]['point'],
        dataList: dataList[index]['list'],
        data: dataList,
        cardIndex: index,
      ),
    );
  }

  Container AlertBox(BuildContext context, int index, String title) {
    return Container(
      height: 200,
      width: 230,
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
            title,
            style: Styles.alertText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  refreshDataList;
                  Navigator.pop(context);
                },
                child: const Text("キャンセル"),
              ),
              TextButton(
                onPressed: () {
                  deleteDataItem(dataList[index]['id']);
                  Navigator.pop(context);
                },
                child: const Text("削除"),
              ),
            ],
          )
        ],
      ),
    );
  }

  AlertDialog EditAlert(BuildContext context, int index) {
    return AlertDialog(
      title: const Text('タイトル変更'),
      content: TextField(
        // controller: model.usernameController,
        decoration: InputDecoration(
          hintText: '${dataList[index]['title']}',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        controller: textController,
        maxLines: 1,
        maxLength: 20,
      ),
      actions: [
        TextButton(
          onPressed: () {
            textController.clear();
            refreshDataList;
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            editDataItem(dataList[index]['id']);
            refreshDataList;
            Navigator.pop(context);
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}
