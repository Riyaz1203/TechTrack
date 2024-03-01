import 'package:flutter/material.dart';
import 'package:techtrack/Pages/MainMenu.dart';

class usersPage extends StatelessWidget {
  const usersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Page"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainMenu()));
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 800,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
