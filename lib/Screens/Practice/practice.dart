import 'package:flutter/material.dart';
import 'package:rto_driving_license/Widgets/Custom%20Appbar/custom_appbar.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Practice', centerTitle: true),
    );
  }
}
