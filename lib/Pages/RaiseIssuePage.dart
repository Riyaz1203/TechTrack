import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RaiseIssue extends StatelessWidget {
  RaiseIssue({super.key});

  final selectRoomController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final itemController = TextEditingController();
  final timeLimitController = TextEditingController();
  final issueDetailController = TextEditingController();

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
          'Raise Issue',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: selectRoomController,
                decoration: const InputDecoration(labelText: 'Select Room'),
              ),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Date'),
              ),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(labelText: 'Time'),
              ),
              TextFormField(
                controller: itemController,
                decoration: const InputDecoration(labelText: 'Item'),
              ),
              TextFormField(
                controller: timeLimitController,
                decoration: const InputDecoration(labelText: 'Time Limit'),
              ),
              TextFormField(
                controller: issueDetailController,
                decoration: const InputDecoration(labelText: 'Issue Detail'),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 100),
        child: ElevatedButton(
          onPressed: () async {
            CollectionReference collRef =
                FirebaseFirestore.instance.collection('raiseIssue');
            await collRef.add({
              'select_room': selectRoomController.text,
              'date': dateController.text,
              'time': timeController.text,
              'item': itemController.text,
              'time_limit': timeLimitController.text,
              'issue_detail': issueDetailController.text
            });
            // Clear text fields after submitting
            selectRoomController.clear();
            dateController.clear();
            timeController.clear();
            itemController.clear();
            timeLimitController.clear();
            issueDetailController.clear();
            // Show a snackbar to indicate that the issue has been raised
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.amber,
                content: Text('Issue has been raised'),
                duration: Duration(seconds: 2),
              ),
            );
          },
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
