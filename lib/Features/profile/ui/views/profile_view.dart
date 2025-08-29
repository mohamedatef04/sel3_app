import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/profile/ui/widgets/profile_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/chats';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserDataCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: ProfileViewBody(),
      ),
    );
  }
}
