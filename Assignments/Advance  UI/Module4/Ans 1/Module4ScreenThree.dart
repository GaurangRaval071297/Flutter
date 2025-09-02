import 'package:flutter/material.dart';

class Module4screenthree extends StatefulWidget {
  const Module4screenthree({super.key});

  @override
  State<Module4screenthree> createState() => _Module4screenthreeState();
}

class _Module4screenthreeState extends State<Module4screenthree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Module 4 Details Screen'), centerTitle: true),
      body: Center(
        child: Text(
          'Details Screeen',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
