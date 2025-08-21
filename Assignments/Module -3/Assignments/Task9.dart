import 'package:flutter/material.dart';

class Task9 extends StatefulWidget {
  const Task9({super.key});

  @override
  State<Task9> createState() => _Task9State();
}

class _Task9State extends State<Task9> {
  TextEditingController textController = TextEditingController();
  var choice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 9',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFormField(controller: textController, enabled: false),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showDigits('AC'),
                showDigits('%'),
                showDigits('C'),
                showDigits('÷'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showDigits('7'),
                showDigits('8'),
                showDigits('9'),
                showDigits('x'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showDigits('4'),
                showDigits('5'),
                showDigits('6'),
                showDigits('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showDigits('1'),
                showDigits('2'),
                showDigits('3'),
                showDigits('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showDigits('00'),
                showDigits('0'),
                showDigits('.'),
                showDigits('='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showDigits(var title) {
    return IconButton(
      onPressed: () {
        onPress(title);
      },
      icon: Text(title),
    );
  }

  onPress(title) {
    textController.text += title;
  }
}
