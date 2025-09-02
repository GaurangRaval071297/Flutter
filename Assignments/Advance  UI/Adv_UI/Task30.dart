import 'package:flutter/material.dart';

class Task30Ex extends StatefulWidget {
  const Task30Ex({super.key});

  @override
  State<Task30Ex> createState() => _Task30State();
}

class _Task30State extends State<Task30Ex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 30"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 80,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/young-man-with-glasses-avatar_1308-175763.jpg?t=st=1756782598~exp=1756786198~hmac=93991ffca17b0523e7deaf04d8759946f14c3289936eeb980717f8c7fba221c5&w=1480",
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 12,
                child: Text(
                  "Gaurang Raval",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 40,
                child: Text(
                  "Flutter App Developer",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}