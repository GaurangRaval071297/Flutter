import 'package:flutter/material.dart';

class Shownumber extends StatefulWidget {
  final List<int> data1;

  Shownumber({Key? key, required this.data1}) : super(key: key);

  @override
  State<Shownumber> createState() => _ShownumberState();
}

class _ShownumberState extends State<Shownumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Numbers'), centerTitle: true),
      body: ListView.builder(
        itemCount: widget.data1.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Number: ${widget.data1[index]}'));
        },
      ),
    );
  }
}
