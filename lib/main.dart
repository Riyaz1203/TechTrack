import 'package:flutter/material.dart';
import 'package:techtrack/Pages/AccessPage.dart';
import 'package:techtrack/Pages/AssignPage.dart';
import 'package:techtrack/Pages/DashBoard.dart';
import 'package:techtrack/Pages/Homepage.dart';
import 'package:techtrack/Pages/MainMenu.dart';
import 'package:techtrack/Pages/MembersLoginPage.dart';
import 'package:techtrack/Pages/RaiseIssuePage.dart';
import 'Pages/IntroPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  _initializeFirebase();
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
      home: const RaiseIssue(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
