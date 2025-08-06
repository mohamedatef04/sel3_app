import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = '/sign-in-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInViewBody(),
    );
  }
}
