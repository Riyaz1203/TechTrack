import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ItemDisplayPage.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Items',
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
            // Navigate to previous page
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Set background color
        padding: const EdgeInsets.all(16.0), // Set padding
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Items').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final items = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  // Wrap each item with GestureDetector for onTap functionality
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemsDisplayPage(
                          item: item, // Pass item data to ItemsDisplayPage
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
                            '${item['image_url']}',
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
                                  'Category  : ${item['category']}',
                                ),
                                Text('Brand       : ${item['brand']}'),
                                Text('Quantity   : ${item['quantity']}'),
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
