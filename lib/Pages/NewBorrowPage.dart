import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewBorrowerPage extends StatelessWidget {
  NewBorrowerPage({super.key});

  final borrowerNameController = TextEditingController();
  final itemNameController = TextEditingController();
  final timeLimitController = TextEditingController();
  final roomNoController = TextEditingController();

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
                controller: borrowerNameController,
                decoration:
                    const InputDecoration(labelText: 'Name Of The Borrower'),
              ),
              TextFormField(
                controller: itemNameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextFormField(
                controller: timeLimitController,
                decoration: const InputDecoration(labelText: 'Time Limit'),
              ),
              TextFormField(
                controller: roomNoController,
                decoration: const InputDecoration(labelText: 'Room No'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 200),
        child: ElevatedButton(
          onPressed: () async {
            CollectionReference collRef =
                FirebaseFirestore.instance.collection('borrower');
            await collRef.add({
              'borrower_name': borrowerNameController.text,
              'item_name': itemNameController.text,
              'time_limit': timeLimitController.text,
              'room_no': roomNoController.text,
            });
            // Clear text fields after submitting
            borrowerNameController.clear();
            itemNameController.clear();
            roomNoController.clear();
            timeLimitController.clear();
            // Show a snackbar to indicate that the issue has been raised
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.amber,
                content: Text('Added Borrower'),
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
