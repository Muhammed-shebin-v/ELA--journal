import 'package:hive_flutter/hive_flutter.dart';

part 'read_model.g.dart';

@HiveType(typeId: 8)
class ReadModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double intake;

  ReadModel({required this.date, required this.intake});
}
