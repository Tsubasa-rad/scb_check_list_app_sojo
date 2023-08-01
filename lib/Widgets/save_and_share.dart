
// ignore_for_file: deprecated_member_use

// スクリーンショットを含めたデータをシェアする
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future saveAndShare(Uint8List bytes) async {
  final directory = await getApplicationDocumentsDirectory();
  final screenShotImage = File('${directory.path}/postScreenshot.png');
  screenShotImage.writeAsBytesSync(bytes);

  await Share.shareFiles([screenShotImage.path], text: "SCBチェックリスト");
}
// 文字列だけでシェアする
Future saveAndShareText(String text) async {
  await Share.share(text, subject: "SCBチェックリスト");
}

void shareCSVDataFile(String csvData, String text, String id) async {
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/SCBCheckList${id}.csv';
    final File file = File(path);
  final encodedData = utf8.encode('\uFEFF' + csvData); // UTF-8 BOMを含むバイトデータを作成
  await file.writeAsBytes(encodedData);
    print('CSVファイルを保存しました: $path');
  
  await Share.shareFiles([file.path], text: text);
}