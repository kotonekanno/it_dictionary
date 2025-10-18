import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:hive/hive.dart';
import '../models/word.dart';
import '../services/hive_service.dart';

class WordProvider extends ChangeNotifier {
  final HiveService _hiveService = HiveService();

  List<Word> _words = [];

  WordProvider() {
    loadAllWords();
  }

  List<Word> get words => _words;

  // Load all words
  Future<void> loadAllWords() async {
    _words = _hiveService.getAllWords();
    notifyListeners();
  }

  // Load default words (only if empty)
  Future<void> loadDefaultWords() async {
    final box = Hive.box<Word>('words');
    if (box.isEmpty) {
      final csvString = await rootBundle.loadString('assets/default_words.csv');
      final rows = const LineSplitter().convert(csvString);
      for (var row in rows.sublist(1)) {
        final parts = row.split(',');
        if (parts.length >= 2) {
          await box.add(Word(mainKey: parts[0], subKey: parts[1]));
        }
      }
      await loadAllWords();
    }
  }

  // Add word
  Future<void> addWord(String mainValue, String subValue) async {
    final word = Word(mainKey: mainValue, subKey: subValue);
    await _hiveService.addWord(word);
    await loadAllWords();
  }

  // Delete word
  Future<void> deleteWord(int index) async {
    await _hiveService.deleteWord(index);
    await loadAllWords();
  }
  
  // Delete all words
  Future<void> deleteAllWords() async {
    await _hiveService.deleteAllWords();
    await loadAllWords();
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

  //Sort words
  void sortWords() {
    _words.sort((a, b) => a.mainKey.toLowerCase().compareTo(b.mainKey.toLowerCase()));
    notifyListeners();
  }
  
  // Export
  Future<void> exportWords() async {
    await _hiveService.exportToCSV(_words);
  }

  // Import
  Future<void> importWords() async {
    await _hiveService.importFromCSV();
    loadAllWords();
  }
}