import 'package:flutter/material.dart';

class Task18 extends StatefulWidget {
  const Task18({super.key});

  @override
  State<Task18> createState() => _Task18State();
}

class _Task18State extends State<Task18> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 18',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
