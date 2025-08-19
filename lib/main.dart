import 'package:flutter/material.dart';
import 'package:harmony_hush/features/auth/presentation/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignInScreen(),);
  }
}