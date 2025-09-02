import 'package:flutter/material.dart';

class BottombarExample extends StatefulWidget {
  const BottombarExample({super.key});

  @override
  State<BottombarExample> createState() => _BottombarExState();
}

class _BottombarExState extends State<BottombarExample> {
  var _selectedIndex = 0;

 final List<Widget> _widgetOptions = [
   Text("Home Screen"),
   Text("Profile"),
   Text("Settings Screen"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bottom NavigationBar Ex',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
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