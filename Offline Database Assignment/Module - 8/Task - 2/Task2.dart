import 'package:flutter/material.dart';
import 'package:task/Offline%20Database%20Assignment/Module%20-%208/Task%20-%202/Task2AddToDo.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Task2addtodo()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
