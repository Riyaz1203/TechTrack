import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ConfirmedBorrow')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final confirmedBorrowers = snapshot.data!.docs.reversed.toList();

          return Column(
            children: [
              const CalendarWidget(), // Calendar widget at the top
              const SizedBox(height: 20),
              const Text(
                'Borrowers',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Item')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Type')),
                    ],
                    rows: confirmedBorrowers
                        .map<DataRow>((borrower) => DataRow(
                              cells: [
                                DataCell(Text(
                                  borrower['name'].toString(),
                                  style: const TextStyle(fontSize: 12),
                                )),
                                DataCell(
                                  Text(
                                    borrower['category'].toString(),
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ),
                                DataCell(Text(
                                  borrower['status'].toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.green),
                                )),
                                DataCell(Text(
                                  borrower['type'].toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                )),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        },
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
