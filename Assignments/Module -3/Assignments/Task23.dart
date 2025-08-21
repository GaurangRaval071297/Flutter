import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task/Assignments/ProfileScreen.dart';
import 'package:task/Assignments/SettingsScreen.dart';

import 'HomeScreen.dart';

class Task23 extends StatefulWidget {
  const Task23({super.key});

  @override
  State<Task23> createState() => _Task23State();
}

class _Task23State extends State<Task23> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task 23',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              accountName: Text('Task 23'),
              accountEmail: Text('Task23@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Text('T', style: TextStyle(fontSize: 25)),
              ),
            ),
            showMenu(Icon(Icons.home), 'Home', Homescreen()),
            showMenu(Icon(Icons.person_2_rounded), 'Profile', Profilescreen()),
            showMenu(Icon(Icons.settings), 'Settings', Settingsscreen()),
          ],
        ),
      ),
    );
  }

  showMenu(icon, title, screen) {
    return ListTile(
      title: Text(title),
      leading: icon,
      iconColor: Colors.black,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
