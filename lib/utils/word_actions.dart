import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';

Future<void> onAddPressed(
  BuildContext context,
  String english,
  String japanese,
  TextEditingController englishController,
  TextEditingController japaneseController,
  FocusNode englishFocus,
) async {
  final wordProvider = context.read<WordProvider>();
  
  if (english.isNotEmpty && japanese.isNotEmpty) {
    
    await wordProvider.addWord(english, japanese);

    englishController.clear();
    japaneseController.clear();

    englishFocus.requestFocus();
  
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('"$english" added')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill both fields')),
    );
  }
}