import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Radiotask2 extends StatefulWidget {
  const Radiotask2({super.key});

  @override
  State<Radiotask2> createState() => _Radiotask2State();
}

class _Radiotask2State extends State<Radiotask2> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  int? _selectedOption;
  num ans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 2'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          children: [
            TextFormField(controller: txt1),
            SizedBox(height: 5),
            TextFormField(controller: txt2),
            SizedBox(height: 5),
            RadioListTile<int>(
              title: Text('Addition'),
              value: 1,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
                _calculate();
              },
            ),
            SizedBox(height: 2),
            RadioListTile<int>(
              title: Text('Substraction'),
              value: 2,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  _calculate();
                });
              },
            ),
            SizedBox(height: 2),
            RadioListTile<int>(
              title: Text('Multiplication'),
              value: 3,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  _calculate();
                });
              },
            ),
            SizedBox(height: 2),
            RadioListTile<int>(
              title: Text('Division'),
              value: 4,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  _calculate();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _calculate() {
    var ans1 = int.parse(txt1.text);
    var ans2 = int.parse(txt2.text);

    switch (_selectedOption) {
      case 1:
        ans = ans1 + ans2;
        break;
      case 2:
        ans = ans1 - ans2;
        break;
      case 3:
        ans = ans1 * ans2;
        break;
      case 4:
        ans = ans1 / ans2;
        break;
        return;
    }
    Fluttertoast.showToast(msg: ans.toString());
  }
}
