import 'package:flutter/material.dart';
import 'package:task/Offline%20Database%20Assignment/Module%20-%208/Task%20-%203/AddNote.dart';
import 'Task3DB.dart';

class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  final dbHelper = MyDb.instance;
  List<Map<String, dynamic>> allCategoryData = [];

  @override
  void initState() {
    super.initState();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addnote()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: allCategoryData.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  var item = allCategoryData[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    color: Colors.grey.shade200,
                    child: ListTile(
                      title: Text(
                        item['category_name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['description']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await dbHelper.deleteNote(item['id']);
                          _query();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print("Fetched ${allRows.length} notes:");
    allRows.forEach((row) => print(row));
    setState(() {
      allCategoryData = allRows;
    });
  }

  void _delete(id)async
  {
    final rowsDeleted = await dbHelper.deleteNote(id);
    print('deleted $rowsDeleted row(s): row $id');
    _query();
  }
}
