import 'package:flutter/material.dart';

class Task3Ans extends StatefulWidget {
  const Task3Ans({super.key});

  @override
  State<Task3Ans> createState() => _Task3State();
}

class _Task3State extends State<Task3Ans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answer 3"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            'I am Gaurang Raval!',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w600,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
