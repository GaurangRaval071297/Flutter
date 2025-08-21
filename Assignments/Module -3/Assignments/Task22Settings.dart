import 'package:flutter/material.dart';

class Task22settings extends StatefulWidget {
  var firstname;
  var secondname;
  Task22settings({required this.firstname, required this.secondname});

  @override
  State<Task22settings> createState() => _Task22settingsState();
}

class _Task22settingsState extends State<Task22settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 22 - Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Details Screen Data is: ${widget.firstname}", style: TextStyle(
              fontSize: 25
            ),),
            SizedBox(height: 15),
            Text("Details Screen Data is: ${widget.secondname}", style: TextStyle(
              fontSize: 25
            ),),
          ],
        ),
      ),
    );
  }
}
