import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/Notifications/Components/notifications_body.dart';
// import 'package:scb_app/Views/Notifications/Components/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationsBody(),
    );
  }
}
