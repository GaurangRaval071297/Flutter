import 'package:flutter/material.dart';
import 'package:task/Task%2020-8/showNumber.dart';

class NumberrangeEx extends StatefulWidget {
  const NumberrangeEx({super.key});

  @override
  State<NumberrangeEx> createState() => _NumberrangeState();
}

class _NumberrangeState extends State<NumberrangeEx> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task1'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(controller: txt1),
            SizedBox(height: 15),
            TextFormField(controller: txt2),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                numberRange();
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  numberRange() {
    var start = int.parse(txt1.text);
    var end = int.parse(txt2.text);
    List<int> range = [];
    for (int i = start + 1; i < end; i++) {
      range.add(i);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Shownumber(data1: range)),
    );
  }
}
