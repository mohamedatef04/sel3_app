import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = '/change-password-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangePasswordViewBody(),
    );
  }
}
