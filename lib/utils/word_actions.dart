import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';

Future<void> onAddPressed(
  BuildContext context,
  String leftKey,
  String rightKey,
  TextEditingController englishController,
  TextEditingController japaneseController,
  FocusNode englishFocus,
) async {
  final wordProvider = context.read<WordProvider>();
  
  if (leftKey.isNotEmpty && rightKey.isNotEmpty) {
    
    await wordProvider.addWord(leftKey, rightKey);

    englishController.clear();
    japaneseController.clear();

    englishFocus.requestFocus();
  
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('"$leftKey" added')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill both fields')),
    );
  }
}