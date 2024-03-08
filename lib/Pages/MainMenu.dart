import 'package:flutter/material.dart';
import 'package:techtrack/Pages/BorrowerPage.dart';
import 'package:techtrack/Pages/HistoryPage.dart';
import 'package:techtrack/Pages/ItemPage.dart';
import 'package:techtrack/Pages/UsersPage.dart';

import '../auth/api.dart';
import 'IntroPage.dart';
import 'RecordsPage.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

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
          'Main Menu',
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
              'Records',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemsPage(),
                  ));
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'Item',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BorrowPage(),
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
              'Borrower',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const usersPage(),
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
              'User',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
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
              'History',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              _logout(context);
            },
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 50, // Button height
            elevation: 1, // Set the elevation value
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),

            child: const Text(
              'Log Out',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

void _logout(BuildContext context) async {
  Auth auth = Auth();
  try {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const IntroPage()),
      (route) => false,
    );
  } catch (error) {
    print('Failed to log out: $error');
    // Handle logout failure
  }
}
