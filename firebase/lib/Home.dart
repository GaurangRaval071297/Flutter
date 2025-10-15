import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/showData.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  CollectionReference addUser = FirebaseFirestore.instance.collection(
    'Students',
  );

  String email = '';
  String name = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Enter Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Password';
                }
                return null;
              },
            ),

            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    name = nameController.text.toString();
                    email = emailController.text.toString();
                    password = passwordController.text.toString();
                    _registerUser();
                    _clearText();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Showdata(),));
                  });
                }
              },

              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    try {
      await addUser.add({'Name': name, 'Email': email, 'Password': password});
      if (!mounted) return;
    } catch (e) {
      print('Something Error In registering User $e');
    }
  }

  _clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
