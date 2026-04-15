import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app1/core/Routing/routes.dart';
import 'package:my_app1/features/login/presentation/login_screen.dart';
import 'package:my_app1/features/onBoarding/onboarding_screen.dart';

class AppRouters {
  static final router = GoRouter(
  initialLocation: Routes.onboarding,
    routes: [
      GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
        ),
      GoRoute(
          path:Routes.login,
          builder: (context , state)=> const  LoginScreen(),
      ),
    ]
  );
}