import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/word_provider.dart';
import '../widgets/centered_max_width.dart';
import '../widgets/word_tile.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wordProvider = context.read<WordProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Word'), centerTitle: true),
      body: CenteredMaxWidth(
        maxWidth: 600,
        child: Column(
          children: [
            SearchBarWidget(wordProvider: wordProvider),
            const Divider(height: 30, indent: 50, endIndent: 50),
            const Expanded(child: WordListWidget()),
          ],
        ),
      ),
    );
  }
}