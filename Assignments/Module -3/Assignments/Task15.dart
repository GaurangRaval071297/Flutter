import 'package:flutter/material.dart';

class Task15 extends StatefulWidget {
  const Task15({super.key});

  @override
  State<Task15> createState() => _Task15State();
}

class _Task15State extends State<Task15> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 15',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5),
            Image.asset('assets/car.jpg', fit: BoxFit.cover),
            SizedBox(height: 5),
            Image.asset('assets/audi.jpg', fit: BoxFit.fill),
            SizedBox(height: 5),
            Image.asset('assets/marcedes.jpg', fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
