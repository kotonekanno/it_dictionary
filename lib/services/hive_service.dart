import 'package:hive/hive.dart';
import '../models/word.dart';

class HiveService {
  Box<Word> getBox() {
    return Hive.box<Word>('words');
  }

  // Add word
  Future<void> addWord(Word word) async {
    final box = getBox();
    await box.add(word);
  }

  // Delete word
  Future<void> deleteWord(int index) async {
    final box = getBox();
    await box.deleteAt(index);
  }

  //Get all words
  List<Word> getAllWords() {
    final box = getBox();
    return box.values.toList();
  }

  //Search word
  List<Word> searchWords(String query) {
    final box = getBox();
    final lowerQuery = query.toLowerCase();
    return box.values.where((word) =>
      word.english.toLowerCase().contains(lowerQuery) ||
      word.japanese.contains(lowerQuery)
    ).toList();
  }
}