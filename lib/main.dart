import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_screen.dart';
import 'list_screen.dart';
import 'pin_code_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PinCodeVerificationScreen(),
      routes: <String, WidgetBuilder>{
        '/listScreen': (context) => const ListScreen(),
        '/homeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
