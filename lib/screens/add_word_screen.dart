import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../providers/word_provider.dart';
import '../widgets/centered_max_width.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  AddWordScreenState createState() => AddWordScreenState();
}

class AddWordScreenState extends State<AddWordScreen> {
  final _englishController = TextEditingController();
  final _japaneseController = TextEditingController();

  final _englishFocus = FocusNode();

  @override
  void dispose() {
    _englishController.dispose();
    _japaneseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context, listen: false);

    void onAddPressed(BuildContext context) async {
      final english = _englishController.text.trim();
      final japanese = _japaneseController.text.trim();

      if (english.isNotEmpty && japanese.isNotEmpty) {
        await wordProvider.addWord(english, japanese);

        _englishController.clear();
        _japaneseController.clear();
        _englishFocus.requestFocus();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('\"$english\" added'))
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill both fields')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Word'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 600,
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (intent) {
                  onAddPressed(context);
                  return null;
                },
              ),
            },
            child:Column(
              children: [
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                    controller: _englishController,
                    focusNode: _englishFocus,
                    decoration: InputDecoration(
                      labelText: 'English',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _japaneseController,
                    decoration: InputDecoration(
                      labelText: 'Japanese',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => onAddPressed(context),
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
                        await context.read<WordProvider>().exportWords();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('CSV exported'))
                        );
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
                        await context.read<WordProvider>().importWords();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('CSV imported'))
                        );
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
            ),
          ),
        ),
      ),
    );
  }
}