import 'package:flutter/material.dart';

class Drawerscreen1 extends StatefulWidget {
  const Drawerscreen1({super.key});

  @override
  State<Drawerscreen1> createState() => _HomescreenState();
}

class _HomescreenState extends State<Drawerscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
