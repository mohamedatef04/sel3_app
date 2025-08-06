import 'package:flutter/material.dart';
import 'package:sel3_app/Features/on_boarding/ui/widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = '/onboarding-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
