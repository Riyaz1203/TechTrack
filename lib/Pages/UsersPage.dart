import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class usersPage extends StatelessWidget {
  const usersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
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
            // Navigate to Member login page
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Set background color
        padding: const EdgeInsets.all(16.0), // Set padding
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('usersdata').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final usersData = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: usersData!.length,
              itemBuilder: (context, index) {
                final users = usersData[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(
                      bottom: 16.0), // Add space between items
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID Number             :   ${users['id_number']}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Name                         :   ${users['name']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Department               :   ${users['department']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Type                           :   ${users['type']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
