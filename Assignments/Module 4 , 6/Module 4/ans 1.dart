import 'package:flutter/material.dart';

import '../Assignments/HomeScreen.dart';
import '../Assignments/ProfileScreen.dart';
import '../Assignments/SettingsScreen.dart';

class Ans1 extends StatefulWidget {
  const Ans1({super.key});

  @override
  State<Ans1> createState() => _Ans1State();
}

class _Ans1State extends State<Ans1> {
  int _selectedIndex = 0;

  static final List _widgetOptions = [
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Settings',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Module 4',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              accountName: Text('Module'),
              accountEmail: Text('Module@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Text('M', style: TextStyle(fontSize: 25)),
              ),
            ),
            showMenu(Icon(Icons.home), 'Home', Homescreen()),
            showMenu(Icon(Icons.person_2_rounded), 'Profile', Profilescreen()),
            showMenu(Icon(Icons.settings), 'Settings', Settingsscreen()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  onItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
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
