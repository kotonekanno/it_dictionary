import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../utils/csv_actions.dart';

class WordInputForm extends StatelessWidget {
  final TextEditingController englishController;
  final TextEditingController japaneseController;
  final FocusNode englishFocus;

  final VoidCallback onAddPressed;

  const WordInputForm({
    required this.englishController,
    required this.japaneseController,
    required this.englishFocus,
    required this.onAddPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final leftKey = context.watch<SettingProvider>().leftKey;
    final rightKey = context.watch<SettingProvider>().rightKey;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: englishController,
              focusNode: englishFocus,
              decoration: InputDecoration(
                labelText: leftKey,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: japaneseController,
            decoration: InputDecoration(
              labelText: rightKey,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: onAddPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 50),
            backgroundColor: const Color.fromARGB(255, 203, 211, 255),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          child: const Text('Add'),
        ),
        Divider(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await exportWordsUtil(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 40),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              child: Text('Export to CSV'),
            ),
            ElevatedButton(
              onPressed: () async {
                await importWordsUtil(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 40),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              child: Text('Import from CSV'),
            ),
          ],
        ),
      ],
    );
  }
}
