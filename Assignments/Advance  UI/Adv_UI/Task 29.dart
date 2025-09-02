import 'package:flutter/material.dart';

class Task29 extends StatefulWidget {
  const Task29({super.key});

  @override
  State<Task29> createState() => _Task29State();
}

class _Task29State extends State<Task29> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 29"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 30),
          Stack(
            children: [
              Image(
                image: NetworkImage(
                  "https://wallpapers.com/images/featured/bmw-d942a3zxd8i3uqc8.jpg",
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  "BMW",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
