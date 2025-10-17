import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rto_driving_license/Screens/Auth/register.dart';
import 'package:rto_driving_license/Screens/Dashboard/home.dart';
import 'package:rto_driving_license/Widgets/Custom%20Button/custom_button.dart';
import 'package:rto_driving_license/Widgets/Custom%20Textfield/custom_textfield.dart';
import '../../Widgets/App Colors/AppColors.dart';
import '../Permission/permission.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTO Login', style: TextStyle(color: Colors.black)),
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
                    controller: pass,
                    keyboardType: TextInputType.visiblePassword,
                    preFixIcon: Icon(Icons.password),
                    hintText: 'Enter Password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: CustomButton(
                    onPressed: () {
                      String e = email.text.toString();
                      String p = pass.text.toString();
                      login(e, p);
                    },
                    child: Text('Login'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                    },
                    child: Text("Don't have an account? Register"),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(var mail, var password) async {
    var url = Uri.parse("https://prakrutitech.xyz/gaurang/gr_login_user.php");
    var resp = await http.post(
      url,
      body: {"email": mail, "password": password},
    );
    var data = jsonDecode(resp.body);
    if (data == 0) {
      print("Login Fail");
    } else {
      print("Login Success");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
}
