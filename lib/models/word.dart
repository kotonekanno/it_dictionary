import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word extends HiveObject {
  @HiveField(0)
  String english;

  @HiveField(1)
  String japanese;

  Word({required this.english, required this.japanese});
}