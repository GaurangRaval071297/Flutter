import 'package:flutter/material.dart';
import 'package:rto_driving_license/Widgets/Custom%20Appbar/custom_appbar.dart';

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  String? _selectedItem;

  // List of categories with their descriptions
  final List<Map<String, String>> _categoryList = [
    {
      'name': 'MCWOG',
      'description':
          'Motorcycle without Gear: Gearless motorcycles like scooters and mopeds, simpler to operate for new riders.',
    },
    {
      'name': 'MCWG',
      'description':
          'Motorcycle with Gear: These vehicles require the rider to shift between gears while driving. Typically, these are standard motorcycles and not gearless scooters.',
    },
    {
      'name': 'LMV',
      'description':
          'Light Motor Vehicle: Includes most passenger cars, jeeps, and vans with a gross weight of up to 3,500 kg.',
    },
    {
      'name': 'HMV',
      'description':
          'Heavy Motor Vehicle: Licenses for larger vehicles used for transporting goods or large passenger groups, with a gross weight greater than 3,500 kg.',
    },
    {
      'name': 'TR',
      'description':
          'Transport Vehicle: Vehicles used for commercial purposes, primarily for the transport of goods and passengers.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Exam', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0,
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.indigo, width: 1),
                ),
                child: DropdownButton<String>(
                  value: _selectedItem,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Select Category for exam',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  items: _categoryList.map((category) {
                    return DropdownMenuItem<String>(
                      value: category['name'],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        child: Text(
                          category['name']!,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                  iconSize: 30,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: _categoryList.length,
              itemBuilder: (context, index) {
                final category = _categoryList[index];
                return ListTile(
                  title: Text(
                    category['name']!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(category['description']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
