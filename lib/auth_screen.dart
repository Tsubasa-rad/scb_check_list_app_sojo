import 'package:flutter/material.dart';
import 'package:csv/csv.dart' as csv;
import 'package:scb_check_list_app_sojo/Views/Home/Widgets/model_2d_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:scb_check_list_app_sojo/base.dart';
import 'package:scb_check_list_app_sojo/database/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool switchValue = true;

  final TextEditingController _idController = TextEditingController();
  List<String> allowedIDs = []; // 許可されたIDを格納するリスト
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    checkAuthStatus();
    loadAllowedIDs();
  }

  void checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    });
  }

  void loadAllowedIDs() async {
    // CSVファイルを読み込む処理
    final csvFileContent = await DefaultAssetBundle.of(context)
        .loadString('assets/models/user_id.csv');
    final csvData = csv.CsvToListConverter().convert(csvFileContent);
    // CSVからIDを抽出してリストに追加
    for (var row in csvData) {
      for (var i = 0; i < row.length; i++) {
        allowedIDs.add(row[i]);
      }
    }
  }

  List<String> flattenNestedList(List<List<String>> nestedList) {
    List<String> flattenedList = [];

    for (var sublist in nestedList) {
      flattenedList.addAll(sublist);
    }

    return flattenedList;
  }

  void _authenticate() {
    final enteredID = _idController.text;

    if (allowedIDs.contains(enteredID)) {
      // 許可されたIDの場合、認証成功
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('認証完了'),
          content: Text('scb理論をお楽しみください!!'),
        ),
      );
      saveAuthStatus(true, enteredID);
      setState(() {
        isAuthenticated = true;
      });
    } else {
      // 許可されていないIDの場合、認証失敗
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'エラー',
            style: TextStyle(color: Colors.red),
          ),
          content: Text('入力されたIDが間違っています。\nもう一度確認をして入力してください'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      return Base();
    } else {
      return Scaffold(
        backgroundColor: baseColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "ようこそ！！",
                  style: Styles.cardHead,
                ),
                Text("IDによる認証をする必要があります。"),
                Text("下にお配りしているIDを入力してください"),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Model2DCard(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        Styles.shadowCard,
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text("IDを入力してください"),
                        TextField(
                          controller: _idController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: baseColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: baseColor,
                                )),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: _authenticate,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                Styles.shadowCard,
                              ],
                            ),
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.login_outlined),
                                Text(
                                  "ログイン",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
