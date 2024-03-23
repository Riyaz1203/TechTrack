import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'AccessPage.dart';

class AddDetails extends StatelessWidget {
  AddDetails({super.key});

  final idNumberController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final genderController = TextEditingController();
  final contactController = TextEditingController();
  final departmentController = TextEditingController();
  final yearController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New User Registration',
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
                controller: idNumberController,
                decoration:
                    const InputDecoration(labelText: 'Institution ID Number'),
              ),
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextFormField(
                controller: genderController,
                decoration: const InputDecoration(labelText: 'Gender M / F'),
              ),
              TextFormField(
                controller: contactController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
              ),
              TextFormField(
                controller: departmentController,
                decoration: const InputDecoration(labelText: 'Department'),
              ),
              TextFormField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Current Year'),
              ),
              TextFormField(
                controller: typeController,
                decoration:
                    const InputDecoration(labelText: 'Faculty / Student'),
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
                FirebaseFirestore.instance.collection('userdata');
            await collRef.add({
              'id_number': idNumberController.text,
              'name': fnameController.text,
              'last_name': lnameController.text,
              'gender': genderController.text,
              'contact': contactController.text,
              'department': departmentController.text,
              'year': yearController.text,
              'type': typeController.text
            });
            // Clear text fields after submitting
            idNumberController.clear();
            lnameController.clear();
            genderController.clear();
            fnameController.clear();
            contactController.clear();
            departmentController.clear();
            yearController.clear();
            typeController.clear();
            // Show a snackbar to indicate that the issue has been raised
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.amber,
                content: Text('New User Registered Successfully'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccessPage()),
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
