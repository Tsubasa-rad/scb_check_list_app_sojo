import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/method_of_operation_models.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class MethodOfOperationScreen extends StatelessWidget {
  const MethodOfOperationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        foregroundColor: fontColor,
        shadowColor: white,
        backgroundColor: barColor,
        title: Text(
          "操作方法",
          style: Styles.cardHead,
        ),
      ),
      body: ListView(
        children: [
          Card(
            color: blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "よくある質問",
                style: Styles.head,
              ),
            ),
          ),
          ...List.generate(
            operationModel.length,
            (index) => MethodCard(
              method: operationModel[index],
            ),
          )
        ],
      ),
    );
  }
}

class MethodCard extends StatefulWidget {
  final MethodOfOperationModel method;
  const MethodCard({
    super.key,
    required this.method,
  });

  @override
  State<MethodCard> createState() => _MethodCardState();
}

class _MethodCardState extends State<MethodCard> {
  bool isDetaile = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDetaile = !isDetaile;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard,
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Q: ${widget.method.title}",
                style: Styles.head,
              ),
              isDetaile
                  ? Text(
                      "A: ${widget.method.detaileText}",
                      style: Styles.cardTextNormal,
                    )
                  : Text("  詳細..."),
            ],
          ),
        ),
      ),
    );
  }
}
