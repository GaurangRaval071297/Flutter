import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Task41 extends StatefulWidget {
  const Task41({super.key});

  @override
  State<Task41> createState() => _Task41State();
}

class _Task41State extends State<Task41> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rating Bar Example'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          children: [
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) {
                Fluttertoast.showToast(msg: '$value');
              },
              initialRating: 0,
              maxRating: 5,
            ),
          ],
        ),
      ),
    );
  }
}
