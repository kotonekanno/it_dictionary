import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../utils/csv_actions.dart';

class WordInputForm extends StatelessWidget {
  final TextEditingController mainController;
  final TextEditingController subController;
  final FocusNode mainFocus;

  final VoidCallback onPressed;

  const WordInputForm({
    required this.mainController,
    required this.subController,
    required this.mainFocus,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mainKey = context.watch<SettingProvider>().mainKey;
    final subKey = context.watch<SettingProvider>().subKey;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: mainController,
              focusNode: mainFocus,
              decoration: InputDecoration(
                labelText: mainKey,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: subController,
            decoration: InputDecoration(
              labelText: subKey,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: onPressed,
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
