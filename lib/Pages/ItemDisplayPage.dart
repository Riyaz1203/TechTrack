import 'package:flutter/material.dart';
import 'package:techtrack/Pages/MainMenu.dart';

class ItemsDisplayPage extends StatelessWidget {
  const ItemsDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ItemsDisplayPage"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainMenu()));
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image in the center
            Center(
              child: Image.network(
                'https://t4.ftcdn.net/jpg/03/24/42/21/360_F_324422176_Lgn7NTeFyNaUKIDu0Ppls1u8zb8wsKS4.jpg',
                width: 400.0,
                height: 300.0,
                // Add any additional properties as needed
              ),
            ),

            // Details using a Column
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category         : No'),
                Text('Model No        : John Doe'),
                Text('SerialID           : 123456'),
                Text('Type                : City'),
                Text('Brand              : Street, Zip Code'),
                Text('Quantity          : Street, Zip Code'),
                Text('Status             : Street, Zip Code'),
                Text('Price               : Street, Zip Code'),
              ],
            ),

            // Submit button
            const SizedBox(height: 20.0), // Add some spacing
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, bottom: 10, right: 10, top: 70),
              child: ElevatedButton(
                onPressed: () {},
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
