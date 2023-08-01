import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/home_card_model.dart';
import 'package:scb_check_list_app_sojo/Views/Home/Widgets/home_middle_card.dart';
import 'package:scb_check_list_app_sojo/Views/Home/Widgets/home_top_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/video_card_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const HomeTopCard(),
          const SizedBox(height: 20),
          Center(
            child: Wrap(
              runSpacing: 15,
              spacing: 10,
              children: cardModel
                  .map((cardModel) => HomeMiddleCard(cardModel: cardModel))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          VideoCardList(),
        ],
      ),
    );
  }
}
