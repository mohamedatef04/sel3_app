import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/splash/ui/view/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
  ],
);
