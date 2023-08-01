
// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

//  長い文章などの時に最初は、短く表示してタップすると全てが表示される
import 'package:flutter/material.dart';

class TextLength extends StatefulWidget {
  TextLength({
    Key? key,
    required this.caption,
  }) : super(key: key);

  final String caption;
  final textStyle =
      const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);

  @override
  State<TextLength> createState() => _TextLengthState();
}

class _TextLengthState extends State<TextLength> {
  late String firstHalf;
  late String secondHalf;
  late int nu = '\n'.allMatches(widget.caption).length + 2;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.caption.length > 50) {
      firstHalf = widget.caption.substring(0, 50);
      secondHalf = widget.caption.substring(51, widget.caption.length);
    } else {
      firstHalf = widget.caption;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.caption.length < 50
            ? Text(widget.caption)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Text(flag ? firstHalf + "...続きを見る" : widget.caption),
                  ),
                ],
              ));
  }
}
