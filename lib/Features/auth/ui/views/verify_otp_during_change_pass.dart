import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/verify_otp_during_change_pass_view_body.dart';

class VerifyOtpDuringChangePass extends StatelessWidget {
  const VerifyOtpDuringChangePass({super.key});
  static const String routeName = '/verify-otp-during-change-pass';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyOtpDuringChangePassViewBody(),
    );
  }
}
