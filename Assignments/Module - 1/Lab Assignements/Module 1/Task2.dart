import 'package:flutter/material.dart';

class Task2Ans extends StatefulWidget {
  const Task2Ans({super.key});

  @override
  State<Task2Ans> createState() => _Task2State();
}

class _Task2State extends State<Task2Ans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome'), centerTitle: true),
      body: Center(
        child: Text(
          'Hello, I am Gaurang Raval!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
