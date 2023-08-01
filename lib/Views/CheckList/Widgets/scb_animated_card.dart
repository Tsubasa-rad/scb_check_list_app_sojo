// ignore_for_file: prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Views/CheckList/Widgets/scb_point_card.dart';
import 'package:scb_check_list_app_sojo/Widgets/save_and_share.dart';
import 'package:scb_check_list_app_sojo/Widgets/style.dart';
import 'package:screenshot/screenshot.dart';

class SCBAnimatedCard extends StatefulWidget {
  final int point;
  final String title;
  final DateTime date;
  final Color color1, color2;

  const SCBAnimatedCard({
    super.key,
    required this.point,
    required this.title,
    required this.date,
    this.color1 = gradation1,
    this.color2 = gradation2,
  });
  @override
  _SCBAnimatedCardState createState() => _SCBAnimatedCardState();
}

class _SCBAnimatedCardState extends State<SCBAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  String _currentTime = '';

  void _getCurrentTime() {
    final currentTime = widget.date;
    final formattedTime =
        '${currentTime.month}/${currentTime.day}/${currentTime.hour}:${currentTime.minute} 作成';
    setState(() {
      _currentTime = formattedTime;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final screenshotcontroller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String grade;
    final Color color;
    if (widget.point >= 90) {
      grade = '秀';
      color = Colors.green;
    } else if (widget.point >= 80) {
      grade = '優';
      color = Colors.blue;
    } else if (widget.point >= 70) {
      grade = '良';
      color = Colors.orange;
    } else {
      grade = '可';
      color = Colors.red;
    }

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.005)
              ..rotateY(2 * 3.14159 * _rotationAnimation.value),
            child: child,
          );
        },
        child: GestureDetector(
          onTap: () async {
            final screenshot = await screenshotcontroller.capture();
            if (screenshot != null) {
              saveAndShare(screenshot);
            }
          },
          child: Screenshot(
              child: SCBPointCard(
                  size: size,
                  currentTime: _currentTime,
                  title: widget.title,
                  point: widget.point,
                  grade: grade,
                  color: color, color1: widget.color1, color2: widget.color2,),
              controller: screenshotcontroller),
        ));
  }
}
