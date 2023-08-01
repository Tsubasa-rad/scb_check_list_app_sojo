import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/method_of_operation_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/setting_button.dart';
import 'package:scb_check_list_app_sojo/Widgets/video_card_list.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        VideoCardList(),
        const SettingButton(
          title: "操作方法",
          subTitle: "操作方法を項目ごとに説明",
          button: "よくある質問",
          icon: Icons.help_outline_rounded,
          fullscreen: false,
          onTap: MethodOfOperationScreen(),
        ),
      ],
    );
  }
}
