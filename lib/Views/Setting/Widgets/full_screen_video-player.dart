// ignore_for_file: deprecated_member_use, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final String url;
  final bool boolURL;
  const FullScreenVideoPlayer({
    super.key,
    required this.url,
    required this.boolURL,
  });

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  double _volume = 0.0;
  bool _showControls = false; // コントロール表示のフラグ
  bool _isLooping = false; // リピートフラグ
  bool _isMuted = true; // 消音フラグ

  @override
  void initState() {
    super.initState();
    _controller = widget.boolURL
        ? VideoPlayerController.network(
            widget.url, // 動画のURLを指定
          )
        : VideoPlayerController.asset(widget.url);

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setVolume(_volume);
    _controller.play();
    _isPlaying = true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleVideoPlay() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _showControls = !_showControls; // コントロール表示のフラグを切り替える
      _isPlaying = _controller.value.isPlaying;
    });
  }

  void _fastForward() {
    final currentPosition = _controller.value.position;
    final duration = _controller.value.duration;
    final newPosition = currentPosition + Duration(seconds: 10); // 10秒進む
    if (newPosition < duration) {
      _controller.seekTo(newPosition);
    }
  }

  void _rewind() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition - Duration(seconds: 10); // 10秒戻る
    _controller.seekTo(newPosition);
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _volume = _isMuted ? 0.0 : 0.9; // ミュート時は音量をゼロに、それ以外は0.5に設定
      _controller.setVolume(_volume);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            // 下へのスワイプジェスチャーが完了したときの処理
            if (details.primaryVelocity! > 0) {
              Navigator.of(context).pop(); // 元のページに戻る
            }
          },
          onTap: _toggleVideoPlay, // 画面タップでコントロール表示を切り替える
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: size.height - 150,
                          width: size.width,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: IconButton(
                            // 消音ボタン
                            icon: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up,
                                color: white),
                            onPressed: _toggleMute,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          VideoProgressIndicator(
                            _controller,
                            colors: VideoProgressColors(
                              playedColor: baseColor, // 再生済みの進行状況の色を赤に設定
                              bufferedColor:
                                  Colors.grey, // バッファリング中の進行状況の色をグレーに設定
                              backgroundColor: Colors.black, // 進行状況バーの背景色を黒に設定
                            ),
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                          ),
                        ],
                      ),
                      Visibility(
                        // コントロール表示の制御
                        visible: _showControls,
                        child: Container(
                          color: black.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: IconButton(
                                  onPressed: () {
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    }
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.replay_10_outlined,
                                        color: white,
                                        size: 50,
                                      ),
                                      onPressed: _rewind,
                                    ),
                                    SizedBox(width: 20),
                                    IconButton(
                                      icon: Icon(
                                        _isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 50,
                                        color: white,
                                      ),
                                      onPressed: _toggleVideoPlay,
                                    ),
                                    SizedBox(width: 20),
                                    IconButton(
                                      icon: Icon(
                                        Icons.forward_10_outlined,
                                        size: 50,
                                        color: white,
                                      ),
                                      onPressed: _fastForward,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
