import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/sign%20in%20cubit/sign_in_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/sign_in_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = '/sign-in-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: SignInViewBody(),
      ),
    );
  }
}
