import 'package:flutter/material.dart';

class Task13 extends StatefulWidget {
  const Task13({super.key});

  @override
  State<Task13> createState() => _Task13State();
}

class _Task13State extends State<Task13> {
  var strImg1 = 'https://www.maahimilk.com/Portals/0/Images/3.png';
  var strImg2 = 'https://www.maahimilk.com/portals/0/Images/CowGheeBig.jpg';
  var img;
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 13',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15),
          isTap ? Image.network(strImg1, height: 100, width: 100) : Image.network(strImg2, height: 100, width: 100),
          SizedBox(height: 15),
          ElevatedButton(onPressed: () {
            setState(() {
              isTap = !isTap;
            });
          }, child: Text('Tap'))
        ],
      ),
    );
  }
}
