import 'package:flutter/material.dart';
import '../providers/word_provider.dart';

class SearchBarWidget extends StatelessWidget {
  final WordProvider wordProvider;
  const SearchBarWidget({super.key, required this.wordProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => wordProvider.search(value),
      ),
    );
  }
}
