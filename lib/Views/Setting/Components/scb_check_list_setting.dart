import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/setting_button.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_setting_model.dart';

class SCBCheckListSetting extends StatelessWidget {
  const SCBCheckListSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        ...List.generate(
          scbSetting.length,
          (index) => SettingButton(
            title: scbSetting[index].title,
            subTitle: scbSetting[index].subTitle,
            button: scbSetting[index].button,
            icon: scbSetting[index].icon,
            alert: scbSetting[index].alert,
            onTap: scbSetting[index].onTap,
          ),
        )
      ],
    );
  }
}
