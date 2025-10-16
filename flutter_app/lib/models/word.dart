import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word extends HiveObject {
  @HiveField(0)
  String mainKey;

  @HiveField(1)
  String subKey;

  Word({required this.mainKey, required this.subKey});
}