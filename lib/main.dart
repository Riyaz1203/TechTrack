import 'package:flutter/material.dart';
import 'package:techtrack/Pages/AccessPage.dart';
import 'package:techtrack/Pages/AssignPage.dart';
import 'package:techtrack/Pages/AssigningPage.dart';
import 'package:techtrack/Pages/DashBoard.dart';
import 'package:techtrack/Pages/Homepage.dart';
import 'package:techtrack/Pages/ItemsDisplayPage.dart';
import 'package:techtrack/Pages/Items_page.dart';
import 'package:techtrack/Pages/MainMenu.dart';
import 'package:techtrack/Pages/MembersLoginPage.dart';
import 'package:techtrack/Pages/RaiseIssuePage.dart';
import 'Pages/IntroPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:techtrack/Pages/ItemPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Track',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AssigningPage(),

    );
  }
}
