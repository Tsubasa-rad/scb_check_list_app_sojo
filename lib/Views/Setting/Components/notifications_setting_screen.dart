import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/Notifications/notifications_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Components/setting_detail_screen.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/setting_button.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class NotificationsSettingScreen extends StatefulWidget {
  const NotificationsSettingScreen({super.key});

  @override
  State<NotificationsSettingScreen> createState() =>
      _NotificationsSettingScreenState();
}

class _NotificationsSettingScreenState
    extends State<NotificationsSettingScreen> {
  bool _isEnabled = true;
  bool _isSoundEnabled = true;
  bool _isVibrationEnabled = true;
  bool _isPreviewEnabled = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        const SettingButton(
          title: "通知について",
          subTitle: "現在到着している通知について",
          button: "通知",
          icon: Icons.notifications,
          onTap: SettingDetailScreen(
            title: "通知",
            bodyView: NotificationsScreen(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                Styles.shadowCard,
              ],
            ),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Enable Notifications'),
                  value: _isEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Sound'),
                  value: _isSoundEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isSoundEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vibration'),
                  value: _isVibrationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isVibrationEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                    title: const Text('Show Preview'),
                    value: _isPreviewEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isPreviewEnabled = value;
                      });
                    }),
              ],
            ),
          ),
        )
      ],
    );
  }
}
