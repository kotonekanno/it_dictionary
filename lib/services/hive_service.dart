import 'dart:io';
import 'package:hive/hive.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
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

  // Export to CSV
  Future<void> exportToCSV(List<Word> words) async {
    List<List<String>> rows = [
      ["English", "Japanese"],
      ...words.map((w) => [w.english, w.japanese]),
    ];

    String csvData = const ListToCsvConverter().convert(rows);

    String? filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save CSV',
      fileName: 'words_export.csv',
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (filePath != null){
      final file = File(filePath);
      await file.writeAsString(csvData);
    }
  }

  // Inport from CSV
  Future<void> importFromCSV() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final csvData = await file.readAsString();

      List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);

      for (int i = 1; i < rows.length; i++) {
        final row = rows[i];
        if (row.length >= 2) {
          final word = Word(
            english: row[0].toString(),
            japanese: row[1].toString(),
          );
          await addWord(word);
        }
      }
    }

    /*
    final csvData = await file.readAsString();
    List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);

    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];
      if (row.length >= 2) {
        final word = Word(
          english: row[0].toString(),
          japanese: row[1].toString(),
        );
        await addWord(word);
      }
    }
    */
  }
}