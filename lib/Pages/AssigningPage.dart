import 'package:flutter/material.dart';

class AssigningPage extends StatelessWidget {
  final String
      selectedTechnician; // Add this line to accept selected technician

  const AssigningPage({
    super.key,
    required this.selectedTechnician, // Update the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Work Assigned',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80, top: 80),
        child: Column(
          children: [
            Container(
              width: 220.0,
              height: 300.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: const Icon(
                Icons.person,
                size: 150.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0), // Add space between the icon and text
            Text(
              selectedTechnician, // Display selected technician here
              style: const TextStyle(
                fontSize: 30.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0), // Add space between the name and role
            const Text(
              'Senior Technician',
              style: TextStyle(
                fontSize: 15.0, // Adjust the font size as needed
                color: Color.fromARGB(255, 61, 56, 56),
              ),
            ),
            const SizedBox(height: 10.0), // Add space between the name and role
            const Text(
              'Work Assigned Successfully',
              style: TextStyle(
                fontSize: 18.0, // Adjust the font size as needed
                color: Color.fromARGB(255, 61, 56, 56),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Set the background color to blue
                ),
                onPressed: () {
                  // Navigate back to the AssignPage
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
