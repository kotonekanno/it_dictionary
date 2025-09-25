import 'package:flutter/material.dart';
import '../models/word.dart';
import '../services/hive_service.dart';

class WordProvider extends ChangeNotifier {
  final HiveService _hiveService = HiveService();

  List<Word> _words = [];
  List<Word> get words => _words;

  WordProvider() {
    loadAllWords();
  }

  // Load all words
  void loadAllWords() {
    _words = _hiveService.getAllWords();
    notifyListeners();
  }

  // Add word
  Future<void> addWord(String english, String japanese) async {
    final word = Word(english: english, japanese: japanese);
    await _hiveService.addWord(word);
    loadAllWords();
  }

  // Delete word
  Future<void> deleteWord(int index) async {
    await _hiveService.deleteWord(index);
    loadAllWords();
  }

  // Search word
  void search(String query) {
    if (query.isEmpty) {
      loadAllWords();
    } else {
      _words = _hiveService.searchWords(query);
      notifyListeners();
    }
  }
  
  /// Import / Export
  Future<void> exportWords() async {
    await _hiveService.exportToCSV(_words);
  }

  Future<void> importWords() async {
    await _hiveService.importFromCSV();
    loadAllWords();
  }
}