import 'package:hive_flutter/hive_flutter.dart';

part 'water_model.g.dart';

@HiveType(typeId: 6)
class WaterModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double intake;

  WaterModel({required this.date, required this.intake});
}
