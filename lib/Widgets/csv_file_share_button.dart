
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Views/ShareSetting/share_setting_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/save_and_share.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class CSVFileShareButton extends StatelessWidget {
  const CSVFileShareButton({
    super.key,
    required this.widget,
    required this.SCBCheckList,
    required this.size,
  });

  final ShareSettingScreen widget;
  final List<List> SCBCheckList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final data = widget.data[widget.cardIndex];
        final fileName = "${data['title']}_${data['category']}";
        for (int i = 0; i < data['list'].length; i++) {
          final scbData = data['list'][i];
          SCBCheckList.add([
            scbData[0],
            "${scbList[i].question} , ${scbList[i].question2}",
            scbData[1],
            scbData[2],
            scbData[3]
          ]);
        }
        SCBCheckList.add(['Data Information']);
        SCBCheckList.add(['Title', data['title']]);
        SCBCheckList.add(['AllPoint', data['point']]);
        SCBCheckList.add(['DateTime', data['time']]);
        // データをCSV形式の文字列に変換
        String csvData = ListToCsvConverter().convert(SCBCheckList);

        shareCSVDataFile(csvData, fileName, data['id']);
      },
      child: Container(
        width: size.width - 40,
        decoration: BoxDecoration(
          color: white,
          gradient: Styles.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "CSVファイルシェア",
              style: Styles.cardText,
            ),
          ],
        ),
      ),
    );
  }
}
