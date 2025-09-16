import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  value--;
                });
              },
              icon: Icon(Icons.minimize),
            ),
            Text('$value'),
            IconButton(
              onPressed: () {
                setState(() {
                  value++;
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
