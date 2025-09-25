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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 600;

          return Align(
            alignment: Alignment.center,
            child: Container(
              padding: isWide ? EdgeInsets.symmetric(vertical: 5) : EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              width: isWide ? 600 : constraints.maxWidth,
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
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      backgroundColor: const Color.fromARGB(255, 203, 211, 255),
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Add'),
                  ),
                ],
              ),
            )
          );
        }
      )
    );
  }
}