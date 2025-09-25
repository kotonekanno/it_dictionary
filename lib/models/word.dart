import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word extends HiveObject {
  @HiveField(0)
  String leftKey;

  @HiveField(1)
  String rightKey;

  Word({required this.leftKey, required this.rightKey});
}