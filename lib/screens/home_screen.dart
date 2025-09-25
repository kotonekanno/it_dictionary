import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';
import '../widgets/word_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Word'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 600;

          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: isWide ? 600 : constraints.maxWidth,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => wordProvider.search(value),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: wordProvider.words.length,
                      itemBuilder: (context, index) {
                        final word = wordProvider.words[index];
                        return WordTile(
                          word: word,
                          onDelete: () => wordProvider.deleteWord(index),
                        );
                      }
                    ),
                  ),
                ]
              ),
            )
          );
        }
      ),
    );
  }
}