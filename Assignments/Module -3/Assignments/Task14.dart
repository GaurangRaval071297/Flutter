import 'package:flutter/material.dart';

class Task14 extends StatefulWidget {
  const Task14({super.key});

  @override
  State<Task14> createState() => _Task14State();
}

class _Task14State extends State<Task14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 14',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
