import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:techtrack/Pages/MainMenu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainMenu()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const CalendarWidget(), // Calendar widget at the top
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: const [
                ListItem(title: 'Item 1'),
                ListItem(title: 'Item 2'),
                ListItem(title: 'Item 3'),
                // Add more list items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;

  const ListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      // Add more list item configurations as needed
    );
  }
}
