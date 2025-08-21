import 'package:flutter/material.dart';
import 'package:task/Assignments/DetailsScreen.dart';

class Task22 extends StatefulWidget {
  const Task22({super.key});

  @override
  State<Task22> createState() => _Task22State();
}

class _Task22State extends State<Task22> {
  TextEditingController txt1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 22 - Home',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            TextFormField(controller: txt1),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Detailsscreen(data: txt1.text,),));
            }, child: Text('Next')),
          ],
        ),
      ),
    );
  }
}
