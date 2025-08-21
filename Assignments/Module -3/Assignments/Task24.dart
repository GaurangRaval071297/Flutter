import 'package:flutter/material.dart';

class Task24 extends StatefulWidget {
  const Task24({super.key});

  @override
  State<Task24> createState() => _Task24State();
}

class _Task24State extends State<Task24> {
  int _selectedIndex = 0;

  static final List _widgetOptions = [
    Text('News', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text(
      'Message',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task 24',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  onItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
