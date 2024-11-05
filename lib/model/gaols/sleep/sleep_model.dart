import 'package:hive_flutter/hive_flutter.dart';

part 'sleep_model.g.dart';
@HiveType(typeId: 9)
class SleepModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double intake;

  SleepModel({required this.date, required this.intake});
}
