import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_hush/features/auth/presentation/screens/sign_in.dart';
import 'package:harmony_hush/features/auth/presentation/screens/sign_up.dart';
import 'package:harmony_hush/features/shared/presentation/onboarding/onboard_screen.dart';
import 'package:harmony_hush/features/shared/presentation/screens/splash_Screen.dart';
import 'package:harmony_hush/features/shared/presentation/screens/welcome_page.dart';

class RouteNames {
  static const signUp = 'signUp';
  static const signIn = 'signIn';
  static const splash = 'splash';
  static const onboard = 'onboard';
  static const welcome = 'welcome';
}

final GoRouter router = GoRouter(
  initialLocation: '/splash', // This is the default screen after restart
  routes: [
    GoRoute(
      path: '/signIn',
      name: RouteNames.signIn,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signUp',
      name: RouteNames.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/splash',
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboard',
      name: RouteNames.onboard,
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: '/welcome',
      name: RouteNames.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
  ],
);