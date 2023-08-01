
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class QuestionsWidget extends StatelessWidget {
  final SCBCheckList question;
  final ValueChanged<OptionModel> onClickedOption;
  const QuestionsWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.option.map((e) => buildOption(context, e)).toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, OptionModel option) {
    final color = getColorForOption(option, question);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            const Icon(Icons.circle),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                option.option,
                softWrap: true,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(OptionModel option, SCBCheckList question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return baseColor;
      }
    }
    return Colors.grey.shade300;
  }
}
