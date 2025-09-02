import 'package:flutter/material.dart';

class Drawerscreen3 extends StatefulWidget {
  const Drawerscreen3({super.key});

  @override
  State<Drawerscreen3> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Drawerscreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Settings')),
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
