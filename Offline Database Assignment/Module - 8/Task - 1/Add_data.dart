import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _formkey = GlobalKey<FormState>();
  late SharedPreferences pref;

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Data'), centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: surname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Surname';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    hintText: 'Surname',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      saveData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign Up Successful')),
                      );
                      Navigator.pop(context); // Navigate back to Task1
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Invalid')));
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Saving data to SharedPreferences
  Future<void> saveData() async {
    pref = await SharedPreferences.getInstance();
    await pref.setString('name', name.text.toString());
    await pref.setString('surname', surname.text.toString());
    await pref.setString('email', email.text.toString());
    await pref.setString('password', password.text.toString());
  }
}
