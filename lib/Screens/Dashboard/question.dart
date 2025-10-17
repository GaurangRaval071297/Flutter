import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionBankScreen extends StatefulWidget {
  @override
  _QuestionBankScreenState createState() => _QuestionBankScreenState();
}

class _QuestionBankScreenState extends State<QuestionBankScreen> {
  List<dynamic> questions = [];
  bool isLoading = true;

  final trafficSigns = [
    {
      'sign': 'Stop Sign',
      'description': 'A red octagonal sign indicating that vehicles must stop and give way to other traffic.',
      'image': 'assets/stop_sign.jpg',
    },
    {
      'sign': 'Yield Sign',
      'description': 'A triangular sign indicating that vehicles should slow down or stop to give way to other vehicles.',
      'image': 'assets/yield_sign.jpg',
    },
    {
      'sign': 'Speed Limit 30',
      'description': 'A round sign indicating the maximum speed of 30 km/h on a particular road.',
      'image': 'assets/speed_limit_30.jpg',
    },
    {
      'sign': 'Speed Limit 50',
      'description': 'A round sign indicating the maximum speed of 50 km/h on a particular road.',
      'image': 'assets/speed_limit_50.png',
    },
    {
      'sign': 'Pedestrian Crossing',
      'description': 'A sign indicating a pedestrian crossing area for safety.',
      'image': 'assets/children_crossing.png',
    },
    {
      'sign': 'No Parking',
      'description': 'A sign indicating that parking is not allowed in this area.',
      'image': 'assets/no_parking.png',
    },
    {
      'sign': 'No U-Turn',
      'description': 'A sign indicating that U-turns are not permitted.',
      'image': 'assets/no_u_turn.png',
    },
    {
      'sign': 'One Way',
      'description': 'A sign indicating that traffic must move in one direction only.',
      'image': 'assets/one_way.png',
    },
    {
      'sign': 'Roundabout',
      'description': 'A sign indicating a roundabout ahead where traffic flows in a circular motion.',
      'image': 'assets/roundabout.png',
    },
    {
      'sign': 'No Entry',
      'description': 'A red circular sign indicating that entry is prohibited.',
      'image': 'assets/no_entry.png',
    },
    {
      'sign': 'Slippery Road',
      'description': 'A sign warning that the road may be slippery due to weather conditions.',
      'image': 'assets/slippery_floor_sign.png',
    },
    {
      'sign': 'School Zone',
      'description': 'A sign indicating that a school zone is ahead, requiring caution and reduced speed.',
      'image': 'assets/school.png',
    },
    {
      'sign': 'Railroad Crossing',
      'description': 'A sign indicating the presence of a railroad crossing ahead.',
      'image': 'assets/railroad_crossing.png',
    },
    {
      'sign': 'Sharp Curve Ahead',
      'description': 'A sign warning of a sharp curve or bend in the road ahead.',
      'image': 'assets/sharp_curve_ahead.jpg',
    },
    {
      'sign': 'Dangerous Hill',
      'description': 'A sign indicating a steep incline or dangerous hill ahead.',
      'image': 'assets/hill.jpg',
    },
    {
      'sign': 'Falling Rocks',
      'description': 'A sign warning of potential falling rocks or debris on the road.',
      'image': 'assets/Falling Rocks.png',
    },
    {
      'sign': 'Animal Crossing',
      'description': 'A sign warning that animals might be crossing the road.',
      'image': 'assets/Animal Crossing.png',
    },
    {
      'sign': 'Parking',
      'description': 'A sign indicating a parking area where vehicles can be parked.',
      'image': 'assets/parking.jpg',
    },
    {
      'sign': 'No Overtaking',
      'description': 'A sign indicating that overtaking or passing other vehicles is not allowed.',
      'image': 'assets/no_overtaking_sign.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    fetchQuestionsFromAPI(1);
  }

  Future<void> fetchQuestionsFromAPI(int id) async {
    try {
      var url = Uri.parse("https://prakrutitech.xyz/gaurang/view_question_by_id.php?id=$id");
      var response = await http.get(url);

      // Debugging: Print the raw response for debugging
      print("API Response: ${response.body}");

      // Check if the response code is 200 (OK)
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        // Assuming the response is wrapped in a key like 'data' or similar
        // Check if there's a 'data' or 'questions' key in the response
        if (responseData['data'] != null) {
          List<dynamic> data = responseData['data'];

          if (data.isEmpty) {
            print("No questions found in API response.");
          }

          setState(() {
            questions = data;
            isLoading = false;
          });
        } else {
          print('No "data" key found in response.');
          setState(() {
            questions = [];
            isLoading = false;
          });
        }
      } else {
        print('Failed to load questions: ${response.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error fetching questions: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Question Bank"),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: "Questions"),
              Tab(text: "Traffic Signs"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Questions list
            isLoading
                ? Center(child: CircularProgressIndicator())
                : questions.isEmpty
                ? Center(child: Text("No questions found."))
                : ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                var question = questions[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question['question'] ?? 'No question',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          question['answer'] ?? 'No answer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {
                            // Bookmark logic
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Tab 2: Traffic Signs
            ListView.builder(
              itemCount: trafficSigns.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            trafficSigns[index]['image']!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(child: Icon(Icons.error));
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          trafficSigns[index]['sign']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          trafficSigns[index]['description']!,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
