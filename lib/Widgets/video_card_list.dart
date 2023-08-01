
import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/video_models.dart';
import 'package:scb_check_list_app_sojo/Views/Setting/Widgets/full_screen_video-player.dart';
import 'package:scb_check_list_app_sojo/Widgets/button_widget.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class VideoCardList extends StatelessWidget {
  const VideoCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Styles.shadowCard,
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "探索[学ぶ]",
              style: Styles.cardHead,
            ),
            Text("動画を通して、詳しく学ぶ..."),
            ...List.generate(
              videoModel.length,
              (index) => ButtonWidget(
                text: videoModel[index].title,
                icon: Icon(
                  videoModel[index].icon,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenVideoPlayer(
                      url: videoModel[index].url,
                      boolURL: videoModel[index].boolURL,
                    ),
                    fullscreenDialog: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
