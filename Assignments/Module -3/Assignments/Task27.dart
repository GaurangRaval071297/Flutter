import 'package:flutter/material.dart';

class Task27 extends StatefulWidget {
  const Task27({super.key});

  @override
  State<Task27> createState() => _Task27State();
}

class _Task27State extends State<Task27> {
  var arrName = ['John', 'Chris', 'White', 'Sam', 'Mathew'];
  var arrDesignation = [
    'Flutter Developer',
    'Java Developer',
    'Python Developer',
    'iOS Developer',
    'Web Developer',
  ];
  var arrProfileImg = [
    'https://www.shutterstock.com/image-vector/male-face-avatar-on-white-260nw-562359640.jpg',
    'https://img.freepik.com/premium-vector/people-saving-money_24908-51568.jpg?semt=ais_hybrid&w=740&q=80',
    'https://static.vecteezy.com/system/resources/previews/002/002/403/non_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg',
    'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    'https://www.shutterstock.com/image-vector/man-character-face-avatar-glasses-260nw-562077406.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task 27',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: arrName.length,
          itemBuilder: (contex, index) {
            return ListTile(
              title: Text(
                arrName[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                arrDesignation[index],
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              leading: CircleAvatar(child: Image.network(arrProfileImg[index])),
              trailing: Icon(Icons.favorite),
              iconColor: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
