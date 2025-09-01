import 'package:flutter/material.dart';

class Loginwithvalidation extends StatefulWidget {
  const Loginwithvalidation({super.key});

  @override
  State<Loginwithvalidation> createState() => _LoginwithvalidationState();
}

class _LoginwithvalidationState extends State<Loginwithvalidation> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController uEmailId = TextEditingController();
  TextEditingController uPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login With Validation'), centerTitle: true),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: TextFormField(
                controller: uEmailId,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Email!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Id',
                  hintText: 'Email Id',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: TextFormField(
                controller: uPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password!';
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged In Successful')),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Invalid')));
                  }
                },
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
