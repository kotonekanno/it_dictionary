import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';
import '../providers/setting_provider.dart';
import '../widgets/centered_max_width.dart';
import '../widgets/word_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value, WordProvider provider) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      provider.search(value);
    });
  }

  Future<void> _confirmAndDelete(BuildContext context, int index, word) async {
    final setting = context.read<SettingProvider>();

    if (setting.confirmBeforeDelete) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Delete Word?',style: TextStyle(fontFamily: 'SUSEMono')),
          content: Text('Are you sure to delete "${word.english}"?',style: TextStyle(fontSize: 16),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Delete',style: TextStyle(color: Colors.indigo)),
            ),
          ],
        ),
      );

      if (confirm != true) return;

      context.read<WordProvider>().deleteWord(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Word'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 600,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _onSearchChanged(value, wordProvider),
              ),
            ),
            Divider(height: 30, indent: 50, endIndent: 50,),
            Expanded(
              child: Consumer<WordProvider>(
                builder: (context, wordProvider, _) => ListView.builder(
                  itemCount: wordProvider.words.length,
                  itemBuilder: (context, index) {
                    final word = wordProvider.words[index];
                    return WordTile(
                      word: word,
                      onDelete: () => _confirmAndDelete(context, index, word),
                    );
                  },
                ),
              ),
            ),
          ],      
        ),
      )
      /*LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 600;

          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: isWide ? 600 : constraints.maxWidth,
              child: Column(
                children: [
                  Padding(
                    padding: isWide
                      ? EdgeInsets.symmetric(vertical: 5)
                      : EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => _onSearchChanged(value, wordProvider), //wordProvider.search(value),
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: Consumer<WordProvider>(
                      builder: (context, wordProvider, _) => ListView.builder(
                        itemCount: wordProvider.words.length,
                        itemBuilder: (context, index) {
                          final word = wordProvider.words[index];
                          return WordTile(
                            word: word,
                            onDelete: () => _confirmAndDelete(context, index, word),
                          );
                            /*() async {
                              final setting = context.read<SettingProvider>();

                              if (setting.confirmBeforeDelete) {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Delete Word?',
                                      style: TextStyle(fontFamily: 'SUSEMono'),
                                    ),
                                    content: Text(
                                      'Are you sure to delete "${word.english}"?',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, false),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.indigo),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, true),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.indigo),
                                        ),
                                      ),
                                    ],
                                  ),
                                );

                                if (confirm != true) {
                                  return;
                                }
                              }
                              wordProvider.deleteWord(index);
                            }
                          );*/
                        }
                      ),
                    ),
                  ),
                ]
              ),
            )
          );
        }
      ),*/
    );
  }
}