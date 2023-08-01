
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class Model3DCard extends StatelessWidget {
  const Model3DCard({
    super.key,
    required this.switchValue,
  });

  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          color: white,
          gradient: Styles.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: switchValue
            ? ModelViewer(
                src: 'assets/models/scb.glb', // 3Dモデルファイルのパス
                alt: "3D Model", // 代替テキスト
                ar: true, // ARモードの有効化
                autoRotate: true, // 自動回転の有効化
                cameraControls: true, // カメラコントロールの有効化
              )
            : Image.asset(
                "assets/images/scb-transparent.png",
                fit: BoxFit.cover, // 画像のスケーリングモード
              ),
      );
  }
}
