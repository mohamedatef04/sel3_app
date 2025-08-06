import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/on_boarding/ui/views/onboarding_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingView(),
    ),
  ],
);
