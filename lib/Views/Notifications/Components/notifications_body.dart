import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 1,
          (context, index) {
            // final PostModel postModel = posts[index];
            return Padding(
                padding: const EdgeInsets.all(10),
                child: notificationsCard(context, false));
          },
        ))
      ],
    );
  }

  Container notificationsCard(
    BuildContext context,
    bool isUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          Styles.shadowCard,
        ],
      ),
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        // onTap: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => CardDetailsView(),
        //       fullscreenDialog: true,
        //     )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("運営"),
                  Text("2023/7/31"),
                ],
              ),
              const Divider(),
              const Text(
                "重要なお知らせ: 現在のところメンテナンスの予定はありません",
              ),
              const Divider(),
              isUrl
                  ? TextButton(
                      onPressed: () async {
                        try {
                          if (await canLaunchUrlString("https://google.com")) {
                            await launch("https://google.com",
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
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          const SizedBox(width: 10),
                          const Text("https://google.com")
                        ],
                      ),
                    )
                  : SizedBox.square(),
            ],
          ),
        ),
      ),
    );
  }
}
