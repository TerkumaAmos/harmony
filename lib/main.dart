import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harmony_hush/app/router.dart'; // Import your router file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // Use your GoRouter instance
    );
  }
}