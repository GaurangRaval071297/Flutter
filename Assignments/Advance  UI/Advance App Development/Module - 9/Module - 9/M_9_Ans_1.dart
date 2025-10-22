import 'package:flutter/material.dart';

class M9Ans1 extends StatefulWidget {
  const M9Ans1({super.key});

  @override
  State<M9Ans1> createState() => _M9Ans1State();
}

class _M9Ans1State extends State<M9Ans1> {
  double _width = 100.0;
  Color _color = Colors.blue;
  double _buttonWidth = 200.0;

  void _updateContainer() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _buttonWidth = _buttonWidth == 200.0 ? 250.0 : 200.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Elevated Button')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateContainer,
              style: ElevatedButton.styleFrom(
                backgroundColor: _color,
                minimumSize: Size(_buttonWidth, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Tap to Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
