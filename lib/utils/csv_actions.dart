import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';

Future<void> exportWordsUtil(BuildContext context) async {
  await context.read<WordProvider>().exportWords();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('CSV exported'))
  );
}

Future<void> importWordsUtil(BuildContext context) async {
  await context.read<WordProvider>().importWords();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('CSV imported'))
  );
}