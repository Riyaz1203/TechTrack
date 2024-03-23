import 'package:flutter/material.dart';

import 'AssigningPage.dart';

class AssignPage extends StatefulWidget {
  const AssignPage({
    super.key,
  });

  @override
  _AssignPageState createState() => _AssignPageState();
}

class _AssignPageState extends State<AssignPage> {
  // Replace these names with your actual list of names
  List<String> technicianNames = [
    'Manoj',
    'Aadhavan',
    'Saravanan',
    'Hemnath',
    'Rahul',
    'Sabari',
  ];
  String selectedTechnician = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select the Technicians',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigate to the previous page
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
        child: ListView.builder(
          itemCount: technicianNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTechnician = technicianNames[index];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(technicianNames[index]),
                        Radio<String>(
                          value: technicianNames[index],
                          groupValue: selectedTechnician,
                          onChanged: (value) {
                            setState(() {
                              selectedTechnician = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Set the background color to blue
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AssigningPage(selectedTechnician: selectedTechnician),
                ),
              );
              print(
                  'OK Button Pressed. Selected Technician: $selectedTechnician');
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
