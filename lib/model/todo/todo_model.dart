import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId:1)

class TodoModel {

  @HiveField(0)
  String? content;

  @HiveField(1)
  bool? isDone;

  TodoModel({
    required this.content,
    required this.isDone
  });
}