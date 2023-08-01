import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/SCB/Components/scb_body.dart';
class SCBDetailScreen extends StatelessWidget {
  const SCBDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SCBBody(),
    );
  }
}