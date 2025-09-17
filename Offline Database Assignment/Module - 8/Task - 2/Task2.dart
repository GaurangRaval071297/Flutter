import 'package:flutter/material.dart';
import 'Task2addtodo.dart';
import 'Task2DB.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  MyDb dbHelper = MyDb.instance;

  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    List<Map<String, dynamic>> tasksList = await dbHelper.queryAllRows();
    setState(() {
      tasks = tasksList;
    });
  }

  Future<void> _toggleTaskStatus(int id, bool isDone) async {
    await dbHelper.updateTaskStatus(id, isDone);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Task2addtodo()),
              ).then((_) => _loadTasks());
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks available.'))
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return ListTile(
            title: Text(
              task['todoTitle'],
              style: TextStyle(
                  decoration: task['isDone'] == 1
                      ? TextDecoration.lineThrough
                      : null),
            ),
            trailing: Checkbox(
              value: task['isDone'] == 1,
              onChanged: (bool? value) {
                _toggleTaskStatus(task['id'], value!);
              },
            ),
            // onLongPress: () async {
            //   await dbHelper.deleteNote(task['id']);
            //   _loadTasks();
            // },
          );
        },
      ),
    );
  }
}