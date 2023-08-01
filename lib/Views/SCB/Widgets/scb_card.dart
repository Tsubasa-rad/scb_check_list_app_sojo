// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_model.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class SCBCard extends StatelessWidget {
  final SCB scb;
  SCBCard({
    super.key,
    required this.scb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          Styles.shadowCard,
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            scb.title,
            style: Styles.head,
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: scb.color,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(20),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            scb.detail.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    Styles.shadowCard,
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("・"),
                    Flexible(
                      child: Text(
                        scb.detail[index],
                        style: Styles.cardTextNormal,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
