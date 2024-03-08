import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReturnedListPage extends StatelessWidget {
  const ReturnedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Returned List',
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
          stream: FirebaseFirestore.instance
              .collection('ConfirmedBorrow')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final confirmBorrow = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: confirmBorrow!.length,
              itemBuilder: (context, index) {
                final confirmborrow = confirmBorrow[index];
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
                          'Borrower Name                       :   ${confirmborrow['name']}',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Returned Item                         :   ${confirmborrow['category']}',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Borrower List                           :   ${confirmborrow['model_no']}',
                          style: const TextStyle(fontSize: 12.0),
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
