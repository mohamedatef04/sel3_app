import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/verify%20otp/verify_otp_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/verify_otp_during_change_pass_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class VerifyOtpDuringChangePass extends StatelessWidget {
  final String phoneNumber;
  const VerifyOtpDuringChangePass({super.key, required this.phoneNumber});
  static const String routeName = '/verify-otp-during-change-pass';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOtpCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        body: VerifyOtpDuringChangePassViewBody(
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}
