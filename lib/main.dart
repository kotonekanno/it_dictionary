import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/word.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WordAdapter());
  await Hive.openBox<Word>('words');
<<<<<<< HEAD
  runApp(const MyApp());
}
=======

  runApp(const MyApp());
}
>>>>>>> bc7733f10f52afc4a2accec05ea3e22b7a03f63f
