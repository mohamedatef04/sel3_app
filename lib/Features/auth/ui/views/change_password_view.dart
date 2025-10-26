import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/send%20phone%20otp/send_phone_otp_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/change_password_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = '/change-password-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendPhoneOtpCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: ChangePasswordViewBody(),
      ),
    );
  }
}
