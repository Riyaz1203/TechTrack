import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'BorrowerDisplayPage.dart';

class BorrowPage extends StatelessWidget {
  const BorrowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Borrowers',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigate to previous page
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
            final borrower = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: borrower!.length,
              itemBuilder: (context, index) {
                final borrowers = borrower[index];
                return GestureDetector(
                  // Wrap each item with GestureDetector for onTap functionality
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BorrowerDisplayPage(
                          item: borrowers, // Pass item data to ItemsDisplayPage
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(1.0),
                    child: Row(
                      children: [
                        // Image Column
                        SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Image.network(
                            '${borrowers['image_url']}',
                            // fit: BoxFit.cover,
                          ),
                        ),
                        // Details Column
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID Number          : ${borrowers['id_number']}',
                                ),
                                Text(
                                    'Name                  : ${borrowers['name']}'),
                                Text(
                                    'Type                    : ${borrowers['type']}'),
                                Text(
                                    'Department        : ${borrowers['department']}'),
                              ],
                            ),
                          ),
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
