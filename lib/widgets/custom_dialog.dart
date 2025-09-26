import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String doText;
  final void Function() doFunction;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.doText,
    required this.doFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(fontFamily: 'SUSEMono')),
      content: Text(content, style: TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancel', style: TextStyle(color: Colors.indigo)),
        ),
        TextButton(
          onPressed: doFunction,
          child: Text(doText, style: TextStyle(color: Colors.indigo)),
        ),
      ]
    );
  }
}