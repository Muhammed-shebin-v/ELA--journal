import 'dart:developer';

import 'package:new_ela/controllers/todo_function.dart';
import 'package:new_ela/model/todo/todo_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/button.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:new_ela/view/widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _toDoController = TextEditingController();
  List<TodoModel> todos = [];
  @override
  void initState() {
    super.initState();
    loadtodo();
  }

  Future<void> loadtodo() async {
    todos = await getTodo();
    todonotifier.value = todos;
    log('get data function');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight *0.1,),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context,true);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    iconSize: 35,
                  ),
                  const CustomHeading(heading: 'ToDo List.', length: 155)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomContainer(
                  color: ElaColors.lightgrey,
                  boxshadow: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Gap(30),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                _createDialog(context);
                              },
                              child: CustomButton(
                                text: 'New',
                                button: true,
                                width: 90,
                              )),
                        ),
                        const Gap(30),
                        SizedBox(height: screenHeight * 0.6, child: _todoUI()),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('create ToDo'),
              content: TextFormField(
                  controller: _toDoController,
                  decoration: const InputDecoration(
                    hintText: 'ToDo',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey), 
                    ),
                  )),
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
                      if (_toDoController.text.isNotEmpty) {
                        String content = _toDoController.text.trim();
                        bool isDonee = false;
                        final todo =
                            TodoModel(content: content, isDone: isDonee);
                        await addTodo(todo: todo);
                        loadtodo();
                        _toDoController.clear();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('create',
                        style: TextStyle(color: Colors.black)))
              ],
              backgroundColor: const Color.fromRGBO(245, 255, 210, 1),
            ));
  }

  void editDialog({required index, required TodoModel todoitem}) async {
    _toDoController.text = todoitem.content ?? 'No ToDo';
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Edit Todo'),
        content: TextFormField(
          controller: _toDoController,
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
            onPressed: () {
              final changedcontent = _toDoController.text.trim();
              final changedtodo =
                  TodoModel(content: changedcontent, isDone: todoitem.isDone);
              updateTodo(todo: changedtodo, updateindex: index);
              loadtodo();
              Navigator.pop(context);
              _toDoController.clear();
            },
            child: const Text('Edit', style: TextStyle(color: Colors.black)),
          ),
        ],
        backgroundColor: const Color.fromRGBO(245, 255, 210, 1),
      ),
    );
  }

  void _deleteDialog(index) {
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

  Widget _todoUI() {
    return ValueListenableBuilder<List<TodoModel>>(
        valueListenable: todonotifier,
        builder: (context, box, child) {
          if (todos.isEmpty) {
            return const Center(
              child: Text(
                'Add New ToDo',
                style: ElaTextStyle.heading,
              ),
            );
          }
          return SizedBox(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                int reverseIndex = todos.length - 1 - index;
                final todoitem = todos[reverseIndex];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainer(
                    color: ElaColors.lightgreen,
                    child: Row(
                      children: [
                        Checkbox(
                          value: todoitem.isDone,
                          onChanged: (value) async {
                            todoitem.isDone = value;
                            final todo = TodoModel(
                                content: todoitem.content,
                                isDone: todoitem.isDone);
                            await updateTodo(
                                todo: todo, updateindex: reverseIndex);
                          },
                          activeColor: ElaColors.green,
                          checkColor: ElaColors.black,
                        ),
                        Expanded(
                          child: Text(
                            todoitem.content ?? 'no content',
                            style: TextStyle(
                              fontSize: 15,
                              decoration: todoitem.isDone ?? false
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              editDialog(index: reverseIndex, todoitem: todoitem);
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            onPressed: () {
                              _deleteDialog(reverseIndex);
                            },
                            icon: const Icon(Icons.delete_outlined))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
