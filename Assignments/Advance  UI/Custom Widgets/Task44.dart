import 'package:flutter/material.dart';

class Task44 extends StatefulWidget {
  const Task44({super.key});

  @override
  State<Task44> createState() => _Task44State();
}

class _Task44State extends State<Task44> {
  bool isOnline = false;

  void toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 44"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/man-profile-account-picture_24908-81754.jpg",
                  ),
                ),
                // Online/Offline Indicator Circle
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    width: 18,
                    height: 18,

                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              isOnline ? "Online" : "Offline",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isOnline ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleStatus,
              child: Text(isOnline ? "Go Offline" : "Go Online"),
            )
          ],
        ),
      ),
    );
  }
}