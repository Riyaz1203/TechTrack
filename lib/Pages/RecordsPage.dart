import 'package:flutter/material.dart';
import 'package:techtrack/Pages/BorrowListPage.dart';
import 'package:techtrack/Pages/BorrowerPage.dart';
import 'package:techtrack/Pages/HistoryPage.dart';
import 'package:techtrack/Pages/IssuseStatusPage.dart';
import 'package:techtrack/Pages/ItemPage.dart';
import 'package:techtrack/Pages/NewBorrowPage.dart';
import 'package:techtrack/Pages/ReturnedListPage.dart';
import 'package:techtrack/Pages/UsersPage.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

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
            // Navigate to Member login page
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Records Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo Image
          Image.asset(
            'assets/Logo.png',
            height: 200, // Adjust height as needed
            width: 50,
          ),
          const SizedBox(height: 20), // Add spacing between image and buttons
          // Buttons
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RecordsPage()));
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'Issues',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IssueStatusPage(),
                  ));
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'New',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewBorrowerPage(),
                  ));
              // Handle button press
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'Borrower List',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BorrowerListPage(),
                  ));
              // Handle button press
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'Returned List',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReturnedListPage(),
                  ));
              // Handle button press
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'Assign',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
