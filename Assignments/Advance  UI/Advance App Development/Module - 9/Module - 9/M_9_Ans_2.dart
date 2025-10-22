import 'package:flutter/material.dart';

class M9Ans2 extends StatefulWidget {
  const M9Ans2({super.key});

  @override
  State<M9Ans2> createState() => _M9Ans2State();
}

class _M9Ans2State extends State<M9Ans2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hero Animation Task",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen2()),
          );
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "hero-image",
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Ds9-v5s9JNTS7Bp9D8QEQq8mKvj5qLjhQw&s",
                  height: 60,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Text("Next Screen", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero Animation Demo - Second Screen")),
      body: Center(
        child: Hero(
          tag: 'hero-tag', // Same tag used in M9Ans2
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              'https://via.placeholder.com/400x300.png',
              width: 300,
              height: 225,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
