
import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Views/ShareSetting/share_setting_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class ShareCardAllQuestion extends StatelessWidget {
  const ShareCardAllQuestion({
    super.key,
    required this.width,
    required this.color1,
    required this.color2,
    required this.widget,
  });

  final width;
  final Color color1;
  final Color color2;
  final ShareSettingScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // 正方形の幅を指定
      height: width, // 正方形の高さを指定
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            color1.withOpacity(0.6),
            color2.withOpacity(0.6),
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 列数を3に設定
              crossAxisSpacing: 3, // 列間のスペースを指定
              mainAxisSpacing: 3, // 行間のスペースを指定
              childAspectRatio: 1.8, // 子要素のアスペクト比を設定
            ),
            physics: NeverScrollableScrollPhysics(), // スクロールを無効にする
            itemCount: scbList.length,
            itemBuilder: (context, index) {
              final scb = scbList[index];
              return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: scb.color.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  children: [
                    Text(
                      scb.question,
                      style: TextStyle(
                        fontSize: 6,
                        color: white,
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.dataList[index][1],
                        style: TextStyle(
                          fontSize: 10,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}

