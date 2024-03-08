import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:techtrack/Pages/IntroPage.dart';
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
      home: const IntroPage(),
    );
  }
}
