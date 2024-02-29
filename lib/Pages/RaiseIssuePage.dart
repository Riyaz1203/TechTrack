import 'package:flutter/material.dart';

class RaiseIssue extends StatelessWidget {
  const RaiseIssue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'RaiseIssue',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Select Room'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Date'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Time'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Item'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Time limit'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Issue Detail'),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 100),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set the background color to blue
          ),
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
