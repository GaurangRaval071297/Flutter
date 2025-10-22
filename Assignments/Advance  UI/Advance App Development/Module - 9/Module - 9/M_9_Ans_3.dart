import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class M9Ans3 extends StatefulWidget {
  const M9Ans3({super.key});

  @override
  State<M9Ans3> createState() => _M9Ans3State();
}

class _M9Ans3State extends State<M9Ans3> {

  Future<List> _loadWithDelay() async {
    final data = await _fetchNews();
    // Wait for 5 seconds before showing data, even if it's already available
    await Future.delayed(const Duration(seconds: 5));
    return data;
  }

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
            // Use custom SpinKit loading animation
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            );
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
