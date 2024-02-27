import 'package:flutter/material.dart';
import 'package:techtrack/Pages/DashBoard.dart';
import 'Pages/IntroPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() {
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
      home: const Dashboard(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
