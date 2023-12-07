// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

import 'dialog_box.dart';
import 'todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ToDoList = [
    ["do exercise", true],
    ["complete task", true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
        ),
        body: ListView.builder(
          itemCount: ToDoList.length,
          itemBuilder: (context, index) => ToDoTile(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          ),
        ));
  }
}
