import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget>? actions;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(fontFamily: 'SUSEMono')),
      content: Text(content, style: TextStyle(fontSize: 16)),
      actions: actions,
    );
  }
}