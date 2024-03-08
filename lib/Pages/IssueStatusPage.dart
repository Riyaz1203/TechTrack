import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IssueStatusPage extends StatelessWidget {
  const IssueStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Issue Status',
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
              FirebaseFirestore.instance.collection('IssuesData').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final issueData = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: issueData!.length,
              itemBuilder: (context, index) {
                final issue = issueData[index];
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
                          'Issue                       :   ${issue['issue']}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Status                         :   ${issue['status']}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Date Of Completion  :   ${issue['date_of_completion']}',
                          style: const TextStyle(fontSize: 14.0),
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
