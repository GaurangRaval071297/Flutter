import 'package:flutter/material.dart';

import 'Module4ScreenThree.dart';

class Module4screentwo extends StatefulWidget {
  const Module4screentwo({super.key});

  @override
  State<Module4screentwo> createState() => _Module4screentwoState();
}

class _Module4screentwoState extends State<Module4screentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module4'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 18),
            Text('This is Product List Screen'),
            SizedBox(height: 18),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Module4screenthree(),));
            }, child: Text('Go to Details Screen'))
          ],
        ),
      ),
    );
  }
}
