import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';

class Model3DScreen extends StatefulWidget {
  const Model3DScreen({super.key});

  @override
  State<Model3DScreen> createState() => _Model3DScreenState();
}

class _Model3DScreenState extends State<Model3DScreen> {
  Color _backgroundColor = Colors.blue; // 初期の背景色

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        toolbarHeight: 50,
        foregroundColor: fontColor,
        shadowColor: white,
        backgroundColor: barColor,
        elevation: 0, // シャドーを無効化
        title: Text(
          "SCB 3D モデル",
          style: Styles.cardHead,
        ),
        actions: [
          IconButton(
            onPressed: _openColorPicker,
            icon: Icon(Icons.color_lens_rounded),
          )
        ],
      ),
      body: const ModelViewer(
        src: 'assets/models/scb.glb', // モデルのパスを指定
        iosSrc: 'assets/models/scbd.usdz', // iOS向けのAR Quick Look用のモデルのパスを指定
        ar: true, // AR表示を有効にする
        autoRotate: true, // モデルの自動回転を有効にする
        cameraControls: true, // カメラコントロールを有効にする
        autoPlay: true, // モデルの自動再生を有効にする
      ),
    );
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('背景色を選択'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _backgroundColor,
              onColorChanged: (Color color) {
                setState(() {
                  _backgroundColor = color;
                });
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('閉じる'),
            ),
          ],
        );
      },
    );
  }
}
