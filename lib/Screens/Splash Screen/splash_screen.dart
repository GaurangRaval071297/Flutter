import 'dart:async';
import 'package:flutter/material.dart';
import '../../Shared Preference/shared_pref.dart';
import '../Dashboard/home.dart';
import '../Intro/intro.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    bool isFirstLaunch = await Pref.isFirstLaunch();

    await Future.delayed(const Duration(seconds: 2));

    if (isFirstLaunch) {
      await Pref.setFirstLaunchDone();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Intro()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            "Budget App",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
