import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';

part 'diary_model.g.dart';

@HiveType(typeId: 4)
class DiaryModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  Uint8List? image1;

  @HiveField(4)
  Uint8List? image2;

  DiaryModel(
      {required this.date,
      required this.title,
      required this.content,
      this.image1,
      this.image2});
}
