import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Components/check_list_title_screen.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/check_list_body.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({super.key});

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  List<Map<String, dynamic>> dataList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
