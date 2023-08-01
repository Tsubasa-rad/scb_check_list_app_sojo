import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/references_model.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
            References.length,
            (index) => ReferencesCard(
                  references: References[index],
                ))
      ],
    );
  }
}

class ReferencesCard extends StatelessWidget {
  final ReferencesModel references;
  const ReferencesCard({
    super.key,
    required this.references,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          try {
            if (await canLaunchUrlString(references.url)) {
              await launch(references.url,
                  forceSafariVC: true, forceWebView: true);
            } else {
              throw 'このページは、開くことができませんでした';
            }
          } catch (e) {
            final snackBar = SnackBar(
              content: Text(e.toString()),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${references.number})${references.title}",
                style: Styles.cardText,
              ),
              SelectableText(
                "URL: ${references.url}",
                style: TextStyle(color: blue),
              ),
              SizedBox(height: 10),
              Text("閲覧日 ${references.date}")
            ],
          ),
        ),
      ),
    );
  }
}
