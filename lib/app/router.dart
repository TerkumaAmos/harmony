import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_hush/features/auth/presentation/screens/sign_in.dart';
import 'package:harmony_hush/features/auth/presentation/screens/sign_up.dart';
import 'package:harmony_hush/features/shared/presentation/onboarding/onboard_screen.dart';
import 'package:harmony_hush/features/shared/presentation/screens/splash_Screen.dart';

class RouteNames {
  static const signUp = 'signUp';
  static const signIn = 'signIn';
  static const splash = 'splash';
  static const onboard = 'onboard';
}

final GoRouter router = GoRouter(
  initialLocation: '/onboard', // This is the default screen after restart
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
  ],
);