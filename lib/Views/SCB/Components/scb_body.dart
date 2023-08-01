import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_model.dart';
import 'package:scb_check_list_app_sojo/Views/SCB/Widgets/scb_card.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/references_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/setting_detail_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SCBBody extends StatelessWidget {
  const SCBBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "SCB理論について...",
            style: Styles.head,
          ),
          ...List.generate(
            scb.length,
            (index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: SCBCard(scb: scb[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ButtonWidget(
              text: "参考文献",
              icon: Icon(
                Icons.room_preferences,
                color: white,
              ),
              color: baseDarkColor,
              onTap: () {
                // 画面遷移を実行
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingDetailScreen(
                      title: "参考文献",
                      bodyView: ReferencesScreen(),
                      automatically: true,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
