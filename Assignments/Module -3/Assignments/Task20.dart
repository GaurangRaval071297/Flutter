import 'package:flutter/material.dart';

class Task20 extends StatefulWidget {
  const Task20({super.key});

  @override
  State<Task20> createState() => _Task20State();
}

class _Task20State extends State<Task20> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 20',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
