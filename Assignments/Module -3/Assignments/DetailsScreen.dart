import 'package:flutter/material.dart';
import 'package:task/Assignments/Task22Settings.dart';

class Detailsscreen extends StatefulWidget {
  var data;
  Detailsscreen({required this.data});

  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 22 - Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text("Home Screen Data is: ${widget.data}", style: TextStyle(
              fontSize: 25
            ),),
            SizedBox(height: 18),
            TextFormField(
              controller: txt1,
              decoration: InputDecoration(
                label: Text('Enter Name'),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: txt2,
              decoration: InputDecoration(
                label: Text('Enter Surname')
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Task22settings(firstname: txt1.text, secondname: txt2.text),));
            }, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
