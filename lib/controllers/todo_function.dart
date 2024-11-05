import 'dart:developer';

import 'package:new_ela/model/todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<TodoModel>> todonotifier = ValueNotifier([]);

Future<void> addTodo({required TodoModel todo}) async {
  final tododb = await Hive.openBox<TodoModel>('todo');
  log(todo.content ?? 'no content');
  await tododb.add(todo);
  todonotifier.value = tododb.values.toList();
  // todonotifier.notifyListeners();
}

Future<void> updateTodo(
{required TodoModel todo, required int updateindex}) async {
  final tododb = await Hive.openBox<TodoModel>('todo');
  await tododb.putAt(updateindex, todo);
  log(todo.content ?? '');
  todonotifier.value = tododb.values.toList();
}

Future<void> deleteTodo({required int deleteindex}) async {
  log('got index $deleteindex');
  final tododb = await Hive.openBox<TodoModel>('todo');
  await tododb.deleteAt(deleteindex);
  log('completed');
  todonotifier.value = tododb.values.toList();
}

Future<List<TodoModel>> getTodo() async {
  final tododb = await Hive.openBox<TodoModel>('todo');
  return tododb.values.toList().cast<TodoModel>();
}

Future<List<TodoModel>> fetchLatestTodos()async {
  final box = await  Hive.openBox<TodoModel>('todo'); 
  var todos = box.values.toList();
  int startIndex = todos.length > 3 ? todos.length - 3 : 0; 
  return todos.sublist(startIndex);
}
