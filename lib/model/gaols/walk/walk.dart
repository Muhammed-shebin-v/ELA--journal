import 'package:hive_flutter/hive_flutter.dart';

part 'walk.g.dart';

@HiveType(typeId: 7)
class WalkModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double intake;

  WalkModel({required this.date, required this.intake});
}
