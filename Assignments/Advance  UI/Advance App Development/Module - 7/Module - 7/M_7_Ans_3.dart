import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class M7Ans3 extends StatefulWidget {
  const M7Ans3({super.key});

  @override
  State<M7Ans3> createState() => _M7Ans3State();
}

class _M7Ans3State extends State<M7Ans3> {
  final TextEditingController _controller = TextEditingController();
  List _movies = [];
  bool _isLoading = false;
  String _error = '';

  // Your new API key
  final String _apiKey = '71f61c8';

  Future<void> _searchMovies(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = '';
      _movies = [];
    });

    final url = Uri.parse('https://www.omdbapi.com/?apikey=$_apiKey&s=$query');
    print('🔎 API URL: $url');

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      print('🌐 API Response: $data');

      if (data['Response'] == 'True') {
        setState(() {
          _movies = data['Search'];
        });
      } else {
        setState(() {
          _error = data['Error'] ?? 'No movies found.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Something went wrong: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎬 Movie Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter movie name',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchMovies(_controller.text),
                ),
              ),
              onSubmitted: _searchMovies,
            ),
            const SizedBox(height: 12),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_error.isNotEmpty)
              Center(
                  child: Text(
                    _error,
                    style: const TextStyle(color: Colors.red),
                  ))
            else if (_movies.isEmpty)
                const Center(child: Text('No movies found. Try searching!'))
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
                      final movie = _movies[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: movie['Poster'] != 'N/A'
                              ? Image.network(
                            movie['Poster'],
                            width: 50,
                            fit: BoxFit.cover,
                          )
                              : const Icon(Icons.movie),
                          title: Text(movie['Title']),
                          subtitle: Text(movie['Year']),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}