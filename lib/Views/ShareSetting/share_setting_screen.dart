
import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/share_color_models.dart';
import 'package:scb_check_list_app_sojo/Models/share_text_models.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/scb_point_card.dart';
import 'package:scb_check_list_app_sojo/Views/ShareSetting/Widgets/share_card_all_question.dart';
import 'package:scb_check_list_app_sojo/Views/ShareSetting/Widgets/share_card_spiral.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/save_and_share.dart';
import 'package:scb_check_list_app_sojo/Widgets/csv_file_share_button.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:screenshot/screenshot.dart';

class ShareSettingScreen extends StatefulWidget {
  final int point, cardIndex;
  final List dataList;
  final String title;
  final DateTime date;
  final List<Map<String, dynamic>> data;

  final String grade;
  final Color color;

  const ShareSettingScreen(
      {super.key,
      required this.point,
      required this.dataList,
      required this.title,
      required this.date,
      required this.data,
      required this.grade,
      required this.color,
      required this.cardIndex});

  @override
  State<ShareSettingScreen> createState() => _ShareSettingScreenState();
}

class _ShareSettingScreenState extends State<ShareSettingScreen> {
  Color color1 = Color.fromARGB(255, 67, 212, 42);
  Color color2 = Color.fromARGB(255, 253, 59, 130);
  int cardIndex = 0;
  int cardColor = 1;
  final screenshotcontroller = ScreenshotController();

  List<List<dynamic>> SCBCheckList = [
    ['questionNumber', 'question', 'answer', 'point', 'comment'],
  ];

  String _currentTime = '';

  void _getCurrentTime() {
    final currentTime = widget.date;
    final formattedTime =
        '${currentTime.month}/${currentTime.day}/${currentTime.hour}:${currentTime.minute} 作成';
    setState(() {
      _currentTime = formattedTime;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontColor,
        shadowColor: white,
        backgroundColor: barColor,
        elevation: 0, // シャドーを無効化
        title: Text("共有の設定"),
        actions: [
          ButtonWidget(
            text: "シェア",
            icon: Icon(
              Icons.ios_share_outlined,
            ),
            onTap: () async {
              final screenshot = await screenshotcontroller.capture();
              if (screenshot != null) {
                saveAndShare(screenshot);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: CSVFileShareButton(
                  widget: widget, SCBCheckList: SCBCheckList, size: size),
            ),
            SizedBox(height: 30),
            Screenshot(
              controller: screenshotcontroller,
              child: Center(
                child: Container(
                  width: size.width,
                  child: Stack(
                    children: [
                      if (cardIndex == 0)
                        Container(
                          width: size.width,
                          height: size.width,
                          child: SCBPointCard(
                            size: size,
                            currentTime: _currentTime,
                            title: widget.title,
                            point: widget.point,
                            grade: widget.grade,
                            color: widget.color,
                            color1: color1,
                            color2: color2,
                          ),
                        )
                      else if (cardIndex == 1)
                        ShareCardAllQuestion(
                          width: size.width,
                          color1: color1,
                          color2: color2,
                          widget: widget,
                        )
                      else if (cardIndex == 2)
                        Stack(
                          children: [
                            ShareCardAllQuestion(
                              width: size.width,
                              color1: color1,
                              color2: color2,
                              widget: widget,
                            ),
                            Container(
                              width: size.width,
                              height: size.width,
                              child: SCBPointCard(
                                size: size,
                                currentTime: _currentTime,
                                title: widget.title,
                                point: widget.point,
                                grade: widget.grade,
                                color: widget.color,
                                color1: white.withOpacity(0),
                                color2: white.withOpacity(0),
                              ),
                            ),
                          ],
                        )
                      else if (cardIndex == 3)
                        ShareCardSpiral(
                            width: size.width,
                            color1: color1,
                            color2: color2,
                            widget: widget,
                            grade: widget.grade,
                            color: widget.color)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("カラー選択", style: Styles.cardText),
            SizedBox(height: 7),
            colorSetting(),
            SizedBox(height: 30),
            Text("デザイン選択", style: Styles.cardText),
            SizedBox(height: 7),
            designSetting(),
          ],
        ),
      ),
    );
  }

  Container designSetting() {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal, // 横方向にスクロールするように設定
          itemCount: shareTextModel.length,
          itemBuilder: (context, index) {
            final shareText = shareTextModel[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  cardIndex = shareText.number;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: shareText.number == cardIndex
                        ? blue
                        : blue.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      shareText.number != cardIndex
                          ? Styles.shadowCard2
                          : Styles.shadowCardBlue
                    ],
                  ),
                  padding: EdgeInsets.all(3),
                  child: Center(
                    child: Text(
                      "${shareText.title}",
                      style: Styles.cardTextNormal,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Container colorSetting() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 横方向にスクロールするように設定
        itemCount: shareColorModel.length,
        itemBuilder: (context, index) {
          final shareModel = shareColorModel[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                color1 = shareModel.color1;
                color2 = shareModel.color2;
                cardColor = shareModel.number;
              });
            },
            child: Container(
              width: 50, // リストアイテムの幅を指定
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [
                    shareModel.color1.withOpacity(0.6),
                    shareModel.color2.withOpacity(0.6),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ],
                ),
                border: Border.all(
                  color: cardColor == shareModel.number
                      ? blue
                      : Colors.transparent, // 選択されたアイテムの枠を赤くする
                  width: 3,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 8), // アイテム間の余白を指定
              alignment: Alignment.center,
              child: Text("${shareModel.number}"),
            ),
          );
        },
      ),
    );
  }
}
