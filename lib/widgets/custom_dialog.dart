import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String rightText;
  final String leftText;
  final void Function() rightFunction;
  final void Function() leftFunction;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.rightText,
    required this.leftText,
    required this.rightFunction,
    required this.leftFunction
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(fontFamily: 'SUSEMono')),
      content: Text(content, style: TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: rightFunction,
          child: Text(rightText, style: TextStyle(color: Colors.indigo)),
        ),
        TextButton(
          onPressed: leftFunction,
          child: Text(leftText, style: TextStyle(color: Colors.indigo)),
        ),
      ]
    );
  }
}