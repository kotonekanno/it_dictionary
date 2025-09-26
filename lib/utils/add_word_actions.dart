import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';

Future<void> onAddPressed(
  BuildContext context,
  String mainKey,
  String subKey,
  TextEditingController mainController,
  TextEditingController subController,
  FocusNode mainFocus,
) async {
  final wordProvider = context.read<WordProvider>();
  
  if (mainKey.isNotEmpty && subKey.isNotEmpty) {
    
    await wordProvider.addWord(mainKey, subKey);

    mainController.clear();
    subController.clear();

    mainFocus.requestFocus();
  
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('"$mainKey" added')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill both fields')),
    );
  }
}