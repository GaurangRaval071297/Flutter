import 'package:flutter/material.dart';

class Task12 extends StatefulWidget {
  const Task12({super.key});

  @override
  State<Task12> createState() => _Task12State();
}

class _Task12State extends State<Task12> {
  bool myvalue = false;
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 12',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Switch(
            value: myvalue,
            activeColor: Colors.black,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.grey,
            onChanged: (bool value) {
              setState(() {
                //myvalue = value;
                if (myvalue == false) {
                  myvalue = true;
                  _backgroundColor = Colors.teal;
                } else {
                  myvalue = false;
                  _backgroundColor = Colors.cyan;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
