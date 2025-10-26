import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/create%20account%20cubit/create_account_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/sign_up_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
