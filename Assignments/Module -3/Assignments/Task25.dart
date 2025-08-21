import 'package:flutter/material.dart';

class Task25 extends StatefulWidget {
  const Task25({super.key});

  @override
  State<Task25> createState() => _Task25State();
}

class _Task25State extends State<Task25> {
  List arrName = [
    "Meeting with Client",
    "Fix reported bugs from QA",
    "Schedule weekly team meeting",
    "Deploy latest build to production",
    "Conduct code review for team members",
    "Workout for 30 minutes",
    "Organize project documentation",
    "Sync latest code from Git repository",
    "Test push notifications functionality",
    "Adjust UI to match latest Figma design",
    "Merge feature branch into development/main",
    "Prepare release build for QA/Play Store",
    "Analyze crash reports from Firebase or Sentry",
    "Improve app startup time",
    "Store data using SQLite or Hive"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 25',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: arrName.length,
        itemBuilder: (context, index) {
          final item = arrName[index];
          return GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                setState(() {
                  arrName.removeAt(index);
                });
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$item deleted')));
              }
            },
            child: ListTile(
              title: Text(arrName[index]),
              subtitle: Column(children: [Divider(color: Colors.grey)]),
              onTap: () {
                //print(arrName[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
