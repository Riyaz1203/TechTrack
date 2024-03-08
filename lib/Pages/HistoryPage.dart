import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
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
          stream: FirebaseFirestore.instance.collection('history').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final history = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: history!.length,
              itemBuilder: (context, index) {
                final historyy = history[index];
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
                          'ID number             :   ${historyy['user']}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Name                         :   ${historyy['description']}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Department               :   ${historyy['time']}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Type                           :   ${historyy['date']}',
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
