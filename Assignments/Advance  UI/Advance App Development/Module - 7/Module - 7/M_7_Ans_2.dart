import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class M7Ans2 extends StatefulWidget {
  const M7Ans2({super.key});

  @override
  State<M7Ans2> createState() => _M7Ans2State();
}

class _M7Ans2State extends State<M7Ans2> {

  Future<List<dynamic>> _fetchNews() async {
    final url =
        'https://newsdata.io/api/1/latest?apikey=pub_82fe3432792146d1a3c404f15444a3ec&q=news';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest News'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          } else {
            final newsArticles = snapshot.data!;

            return ListView.builder(
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                var article = newsArticles[index];
                return ListTile(
                  title: Text(article['title'] ?? 'No Title'),
                  subtitle: Text(article['description'] ?? 'No Description'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
