import 'dart:developer';

import 'package:new_ela/controllers/todo_function.dart';
import 'package:new_ela/model/todo/todo_model.dart';
import 'package:flutter/material.dart';

void deleteDialog({required index,required context,required function}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete ToDo'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () async {
                      await deleteTodo(deleteindex: index);
                      loadtodo();
                      log('passed to function $index');
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: const Text('Delete',
                        style: TextStyle(color: Colors.black)))
              ],
              backgroundColor: const Color.fromRGBO(245, 255, 210, 1),
            ));
  }
  List<TodoModel> todos = [];
  Future<void> loadtodo() async {
    todos = await getTodo();
    todonotifier.value = todos;
    log('get data function');
  }