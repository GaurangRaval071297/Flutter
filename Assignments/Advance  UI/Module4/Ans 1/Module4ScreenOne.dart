import 'package:flutter/material.dart';

import 'Module4ScreenTwo.dart';

class Module4screenone extends StatefulWidget {
  const Module4screenone({super.key});

  @override
  State<Module4screenone> createState() => _Module4screenoneState();
}

class _Module4screenoneState extends State<Module4screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 4'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Module4screentwo()));
        }, child: Text('Go to Product List Screen')),
      ),
    );
  }
}
