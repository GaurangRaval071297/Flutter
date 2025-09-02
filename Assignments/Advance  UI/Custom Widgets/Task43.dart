import 'package:flutter/material.dart';

class Task43 extends StatefulWidget {
  const Task43({super.key});

  @override
  State<Task43> createState() => _Task43State();
}

class _Task43State extends State<Task43> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 43"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/man-profile-account-picture_24908-81754.jpg",
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Gaurang Raval",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Flutter App Developer",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
