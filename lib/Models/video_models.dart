import 'package:flutter/material.dart';

class VideoModels {
  final String title;
  final String url;
  final bool boolURL;
  final icon;

  VideoModels({
    required this.title,
    required this.icon,
    required this.boolURL,
    required this.url,
  });
}

List videoModel = [
  VideoModels(
    title: "SCBについての説明動画",
    icon: Icons.video_collection_outlined,
    boolURL: true,
    url:
        "https://firebasestorage.googleapis.com/v0/b/scb-check-list-app.appspot.com/o/videos%2Fscb.mp4?alt=media&token=e433f539-eda6-4f62-94f3-8973e0790d82",
  ),
  VideoModels(
    title: "アプリにつての説明",
    icon: Icons.video_camera_back_rounded,
    boolURL: true,
    url:
        "https://firebasestorage.googleapis.com/v0/b/scb-check-list-app.appspot.com/o/videos%2Fscb_promotion.mp4?alt=media&token=269cec66-4d9e-4f4a-b944-69168882b876",
  ),
];
