// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/setting_detail_screen.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SettingCardWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool arrow, automatically;
  final bodyView;
  const SettingCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.arrow,
    this.bodyView,
    required this.automatically,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        child: ListTile(
          leading: icon,
          title: Text(title),
          trailing: arrow
              ? Icon(Icons.keyboard_arrow_right)
              : const SizedBox.shrink(),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingDetailScreen(
                  title: title,
                  bodyView: bodyView,
                  automatically: automatically,
                ),
              )),
        ),
      ),
    );
  }
}
