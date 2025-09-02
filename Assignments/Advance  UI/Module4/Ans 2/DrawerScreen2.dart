import 'package:flutter/material.dart';

class Drawerscreen2 extends StatefulWidget {
  const Drawerscreen2({super.key});

  @override
  State<Drawerscreen2> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Drawerscreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Profile')),
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
