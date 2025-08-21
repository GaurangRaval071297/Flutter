import 'package:flutter/material.dart';

class Task8 extends StatefulWidget {
  const Task8({super.key});

  @override
  State<Task8> createState() => _Task8State();
}

class _Task8State extends State<Task8> {
  List arrName = ['John', 'Chris', 'White', 'Sam', 'Mathew'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task 8',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: arrName.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(arrName[index]),
            subtitle: Column(children: [Divider(color: Colors.grey)]),
            onTap: () {
              print(arrName[index]);
            },
          );
        },
      ),
    );
  }
}
