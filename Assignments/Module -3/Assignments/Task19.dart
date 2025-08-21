import 'package:flutter/material.dart';

class Task19 extends StatefulWidget {
  const Task19({super.key});

  @override
  State<Task19> createState() => _Task19State();
}

class _Task19State extends State<Task19> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 19',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
