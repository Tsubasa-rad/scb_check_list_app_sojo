// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/auth_screen.dart';
import 'package:scb_check_list_app_sojo/base.dart';
import 'package:scb_check_list_app_sojo/database/auth_storage.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Base(),
      home: AuthScreen(),
    );
  }
}