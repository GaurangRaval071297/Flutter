import 'package:flutter/material.dart';
import 'Task2DB.dart';

class Task2addtodo extends StatefulWidget {
  const Task2addtodo({super.key});

  @override
  State<Task2addtodo> createState() => _Task2addtodoState();
}

class _Task2addtodoState extends State<Task2addtodo> {
  final _addNote = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  MyDb dbHelper = MyDb.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add To-Do'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addNote,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: title,
                  validator: (value) =>
                  value!.isEmpty ? 'Please Enter Titles!' : null,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (_addNote.currentState!.validate()) {
                      await _insert();
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to insert data into the database
  Future<void> _insert() async {
    Map<String, dynamic> row = {
      MyDb.title: title.text,
      MyDb.isDone: 0,
    };

    final id = await dbHelper.insertdata(row);
    print("Inserted Note ID: $id");

    title.clear();
  }
}