import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  _AddWordScreenState createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final _englishController = TextEditingController();
  final _japaneseController = TextEditingController();

  @override
  void dispose() {
    _englishController.dispose();
    _japaneseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Word'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _englishController,
              decoration: InputDecoration(
                labelText: 'English',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _japaneseController,
              decoration: InputDecoration(
                labelText: 'Japanese',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final english = _englishController.text.trim();
                final japanese = _japaneseController.text.trim();

                if (english.isNotEmpty && japanese.isNotEmpty) {
                  await wordProvider.addWord(english, japanese);
                  _englishController.clear();
                  _japaneseController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('\"$english\" added'))
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill both fields')),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}