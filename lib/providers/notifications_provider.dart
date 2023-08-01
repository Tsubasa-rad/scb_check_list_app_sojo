
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:scb_app/Models/notifications_model.dart';

// class NotificationListModel extends ChangeNotifier {
//   final _notificationCollection = FirebaseFirestore.instance
//       .collection('notifications')
//       .orderBy('createAt', descending: true);
//       // .limit(5);

//   List<NotificationsModel>? notifications;

//   void fetchNotificationList() async {
//     final QuerySnapshot getNotification = await _notificationCollection.get();

//     final List<NotificationsModel> notifications =
//         getNotification.docs.map((DocumentSnapshot document) {
//       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//       final String title = data['title'];
//       final String detail = data['detail'];
//       final String url = data['url'];
//       final DateTime createAt = data['createAt'].toDate();

//       return NotificationsModel(title, detail, url, createAt,);
//     }).toList();
//     this.notifications = notifications;
//     notifyListeners();
//   }
// }
