import 'package:flutter/material.dart';

class Radiotask3 extends StatefulWidget {
  const Radiotask3({super.key});

  @override
  State<Radiotask3> createState() => _Radiotask3State();
}

class _Radiotask3State extends State<Radiotask3> {
  Color _bodyColor = Colors.red;
  int? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _bodyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile<int>(
              title: Text('Red'),
              value: 1,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  _bodyColor = Colors.red;
                });
              },
            ),
            RadioListTile<int>(
              title: Text('Green'),
              value: 2,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  _bodyColor = Colors.green;
                });
              },
            ),
            RadioListTile<int>(
              title: Text('Blue'),
              value: 3,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  _bodyColor = Colors.blue;
                });
              },
            ),
            RadioListTile<int>(
              title: Text('Purple'),
              value: 4,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  _bodyColor = Colors.purple;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
