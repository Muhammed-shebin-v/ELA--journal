import 'package:hive_flutter/hive_flutter.dart';

part 'mood_model.g.dart';

@HiveType(typeId: 5)
class MoodModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String mood;

  MoodModel({required this.date, required this.mood});
}
