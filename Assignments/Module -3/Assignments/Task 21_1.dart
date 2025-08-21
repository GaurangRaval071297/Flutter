import 'package:flutter/material.dart';
import 'package:task/Assignments/Task21_2.dart';

class Task21_Screen1 extends StatefulWidget {
  const Task21_Screen1({super.key});

  @override
  State<Task21_Screen1> createState() => _Task21_Screen1State();
}

class _Task21_Screen1State extends State<Task21_Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task 21',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Task21_Screen2()),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}
