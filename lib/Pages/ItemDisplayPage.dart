import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsDisplayPage extends StatelessWidget {
  final DocumentSnapshot item; // Define a variable to store item data

  const ItemsDisplayPage({Key? key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          item['category'],
          style: TextStyle(color: Colors.white),
        ), // Use the category name directly
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image in the center
            Center(
              child: Image.network(
                '${item['image_url']}',
                width: 400.0,
                height: 200.0,
                // Add any additional properties as needed
              ),
            ),

            // Details using a Column
            Expanded(
              child: Center(
                child: Container(
                  color: Color.fromARGB(255, 243, 229, 229),
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 50, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '                        Category         :    ${item['category']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Model No        :    ${item['model_no']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Serial Id          :    ${item['serial_id']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Type                :    ${item['type']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Brand              :    ${item['brand']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Quantity          :    ${item['quantity']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Status             :    ${item['status']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '                        Price               :    ${item['price']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      // Add more details here
                    ],
                  ),
                ),
              ),
            ),

            // Submit button
            const SizedBox(height: 20.0), // Add some spacing
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, bottom: 30, right: 10, top: 70),
              child: ElevatedButton(
                onPressed: () {
                  // Implement any action for submit button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Set the background color to blue
                ),
                child: const Text(
                  'Confirm Browser',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
