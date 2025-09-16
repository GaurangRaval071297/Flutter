import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Add_data.dart';


class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  late SharedPreferences pref;
  String name1 = '';
  String surname1 = '';
  String email1 = '';
  String password1 = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  // Async loading data from SharedPreferences
  Future<void> loadUserData() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      name1 = pref.getString('name') ?? 'No name';
      surname1 = pref.getString('surname') ?? 'No surname';
      email1 = pref.getString('email') ?? 'No email';
      password1 = pref.getString('password') ?? 'No password';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data'), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            title: Text(name1),
            subtitle: Text(surname1),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddData()),
          ).then((value) {
            // After returning from AddData, reload user data
            loadUserData();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
