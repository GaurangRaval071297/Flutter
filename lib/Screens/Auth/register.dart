import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rto_driving_license/Widgets/Custom%20Button/custom_button.dart';

import '../../Widgets/Custom Textfield/custom_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTO Registration', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset('assets/logo.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: CustomTextfield(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    preFixIcon: Icon(Icons.email),
                    hintText: 'Enter Email Address',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: CustomTextfield(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    preFixIcon: Icon(Icons.password),
                    hintText: 'Enter Password',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: CustomButton(
                    onPressed: () {

                      String reg_name = name.text.toString();
                      String reg_email = email.text.toString();
                      String reg_password = password.text.toString();
                      register(reg_name, reg_email, reg_password);
                    },
                    child: Text("Register"),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   register(String reg_name, String reg_email, String reg_password) async {
    var url = Uri.parse("https://prakrutitech.xyz/gaurang/gr_add_user.php");
    var resp = await http.post(url, body: {
      "name": reg_name,
      "email": reg_email,
      "password": reg_password
    });
    
    var data = jsonDecode(resp.body);
    if (data == 0) {
      print("Registration Fail");
    } else {
      print("Registration Successfully");
      Navigator.pop(context);
    }
   }
}
