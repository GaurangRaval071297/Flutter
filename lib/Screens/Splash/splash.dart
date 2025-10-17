import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/login.dart';
import '../Connectivity  Error/connectivity_error_screen.dart';
import '../Dashboard/home.dart';
import '../SharedPreference/SharePref.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) async {
      if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)) {
        // Check if user is logged in
        bool isLoggedIn = await SharedPref.getLoginStatus();

        if (isLoggedIn) {
          // If logged in, go to Home
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else {
          // If not logged in, go to Login Screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        }
      } else {
        // If no connectivity, show error screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ConnectivityErrorScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
