import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/inserts%20new%20pass/insert_new_password_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/insert_new_pass_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class InsertNewPassView extends StatelessWidget {
  const InsertNewPassView({super.key});
  static const routeName = '/insertNewPassView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsertNewPasswordCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: InsertNewPassViewBody(),
      ),
    );
  }
}
