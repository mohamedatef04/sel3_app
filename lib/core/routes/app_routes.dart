import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/change_password_view.dart';
import 'package:sel3_app/Features/auth/ui/views/congrates_view.dart';
import 'package:sel3_app/Features/auth/ui/views/insert_new_pass_view.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_in_view.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_up_view.dart';
import 'package:sel3_app/Features/auth/ui/views/verify_account_view.dart';
import 'package:sel3_app/Features/auth/ui/views/verify_otp_during_change_pass.dart';
import 'package:sel3_app/Features/on_boarding/ui/views/onboarding_view.dart';
import 'package:sel3_app/Features/splash/ui/view/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: OnboardingView.routeName,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: SignInView.routeName,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: SignUpView.routeName,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: ChangePasswordView.routeName,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: VerifyAccountView.routeName,
      builder: (context, state) => const VerifyAccountView(),
    ),
    GoRoute(
      path: VerifyOtpDuringChangePass.routeName,
      builder: (context, state) => VerifyOtpDuringChangePass(
        phoneNumber: state.extra as String? ?? '',
      ),
    ),
    GoRoute(
      path: InsertNewPassView.routeName,
      builder: (context, state) => const InsertNewPassView(),
    ),
    GoRoute(
      path: CongratesView.routeName,
      builder: (context, state) => const CongratesView(),
    ),
    GoRoute(
      path: VerifyAccountView.routeName,
      builder: (context, state) => const VerifyAccountView(),
    ),
  ],
);
