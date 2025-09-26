import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:it_dictionary/widgets/centered_max_width.dart';
import '../models/word.dart';
import '../providers/setting_provider.dart';
import '../providers/word_provider.dart';
import '../widgets/custom_dialog.dart';

class WordTile extends StatelessWidget {
  final Word word;
  final VoidCallback onDelete;

  const WordTile({super.key, required this.word, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return CenteredMaxWidth(
      maxWidth: 600,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          return Row(
            children: [
              SizedBox(
                width: maxWidth - 90,  // IconButton = 40
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          word.mainKey,
                          style: TextStyle(fontSize: 16,fontFamily: 'SUSEMono'),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          word.subKey,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                padding: EdgeInsets.symmetric(vertical: 5),
                constraints: BoxConstraints(),
                onPressed: onDelete,
              ),
            ],
          );
        },
      ),
    );
  }
}

class WordListWidget extends StatelessWidget {
  const WordListWidget({super.key});

  Future<void> _confirmAndDelete(BuildContext context, int index, word) async {
    final setting = context.read<SettingProvider>();
    bool shouldDelete = true;

    if (setting.confirmBeforeDelete) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => CustomDialog(
          title: 'Delete Word?',
          content: 'Are you sure to delete "${word.mainKey}"?',
          doText: 'Delete',
          doFunction: () => Navigator.pop(context, true),
        ),
      );
      shouldDelete = confirm == true;
    }

    if (shouldDelete) context.read<WordProvider>().deleteWord(index);
  }

  @override
  Widget build(BuildContext context) {
    final mainKey = context.watch<SettingProvider>().mainKey;
    final subKey = context.watch<SettingProvider>().subKey;

    return Consumer<WordProvider>(
      builder: (context, wordProvider, _) {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 100),
          itemCount: wordProvider.words.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(mainKey, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Text(subKey, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(height: 20, thickness: 0.5, color: Colors.black),
                  ),
                ],
              );
            }
            final word = wordProvider.words[index - 1];
            return WordTile(
              word: word,
              onDelete: () => _confirmAndDelete(context, index - 1, word),
            );
          }
        );
      },
    );
  }
}
