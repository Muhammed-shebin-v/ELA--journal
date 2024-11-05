import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';

part 'bucket_model.g.dart';

@HiveType(typeId: 3)
class BucketModel {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? destination;

  @HiveField(2)
  DateTime? finalDate;

  @HiveField(3)
  String? content;

  @HiveField(4)
  Uint8List? image1;

  @HiveField(5)
  Uint8List? image2;

  @HiveField(6)
  int? catogarynumber;

  @HiveField(7)
  dynamic createDate;



  BucketModel(
      {required this.title,
      required this.content,
      required this.catogarynumber,
      required this.createDate,
      this.finalDate,
      this.destination,
      this.image1,
      this.image2
      });
}
