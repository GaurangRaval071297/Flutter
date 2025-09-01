import 'package:flutter/material.dart';

class RegisterValidation extends StatefulWidget {
  const RegisterValidation({super.key});

  @override
  State<RegisterValidation> createState() => _RegistervalidationState();
}

class _RegistervalidationState extends State<RegisterValidation> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController uName = TextEditingController();
  TextEditingController uEmailId = TextEditingController();
  TextEditingController uPhoneNumber = TextEditingController();
  TextEditingController uPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Validation'), centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: TextFormField(
                  controller: uName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: TextFormField(
                  controller: uPhoneNumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Phone Number!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                    if (_formKey.currentState!.validate()) {
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
      ),
    );
  }
}
