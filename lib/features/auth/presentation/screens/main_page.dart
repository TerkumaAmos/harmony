import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harmony_hush/features/shared/presentation/onboarding/onboard_screen.dart';
import 'package:harmony_hush/features/shared/presentation/screens/welcome_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred. Please try again.'));
          }
          if (snapshot.hasData) {
            return const WelcomePage();
          } else {
            return const OnboardScreen();
          }
        },
      ),
    );
  }
}