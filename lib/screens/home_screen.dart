import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';
import '../providers/setting_provider.dart';
import '../widgets/centered_max_width.dart';
import '../widgets/word_tile.dart';
import '../widgets/custom_dialog.dart';

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

    bool shouldDelete = true;

    if (setting.confirmBeforeDelete) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => CustomDialog(
          title: 'Delete Word?',
          content: 'Are you sure to delete "${word.leftKey}"?',
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancel',style: TextStyle(color: Colors.indigo)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Delete',style: TextStyle(color: Colors.indigo)),
            ),
          ],
        )
      );

      shouldDelete = confirm == true;
    }

    if (shouldDelete){ 
      context.read<WordProvider>().deleteWord(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context);

    final leftKey = context.watch<SettingProvider>().leftKey;
    final rightKey = context.watch<SettingProvider>().rightKey;

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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                  itemCount: wordProvider.words.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0){
                      return CenteredMaxWidth(
                        maxWidth: 400,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(leftKey, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                    Padding(
                                      padding: EdgeInsets.only(right: 70),  // IconButton40 + 30
                                      child:Text(rightKey, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                height: 20,
                                thickness: 0.5,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    final word = wordProvider.words[index - 1];
                    return WordTile(
                      word: word,
                      onDelete: () => _confirmAndDelete(context, index - 1, word),
                    );
                  },
                ),
              ),
            ),
          ],      
        ),
      )
    );
  }
}