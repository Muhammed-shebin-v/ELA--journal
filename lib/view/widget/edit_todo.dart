import 'dart:developer';

import 'package:new_ela/controllers/todo_function.dart';
import 'package:new_ela/model/todo/todo_model.dart';
import 'package:flutter/material.dart';

Future<void> editdialog(
    {required index,
    required TodoModel todoitem,
    required context,
    required TextEditingController toDoController}) async {
  toDoController.text = todoitem.content ?? 'No ToDo';
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Edit Todo'),
      content: TextFormField(
        controller: toDoController,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: ()  async {
            final changedcontent = toDoController.text.trim();
            final changedtodo =
            TodoModel(content: changedcontent, isDone: todoitem.isDone);
            await updateTodo(todo: changedtodo, updateindex: index);
            log('updated');
            Navigator.pop(context);
            toDoController.clear();
            log('cleared');
          },
          child: const Text('Edit', style: TextStyle(color: Colors.black)),
        ),
      ],
      backgroundColor: const Color.fromRGBO(245, 255, 210, 1),
    ),
  );
}
