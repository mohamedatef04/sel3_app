import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/verify_account_view_body.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});
  static const String routeName = '/verify-account-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyAccountViewBody(),
    );
  }
}
