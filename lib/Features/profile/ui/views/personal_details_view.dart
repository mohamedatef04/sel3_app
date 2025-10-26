import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/profile/data/repos/update_user_pic_repo_impl.dart';
import 'package:sel3_app/Features/profile/data/repos/upload_user_pic_repo_impl.dart';
import 'package:sel3_app/Features/profile/logic/cubits/update_user_pic_cubit/update_user_pic_cubit.dart';
import 'package:sel3_app/Features/profile/logic/cubits/upload_user_pic_cubit/upload_user_pic_cubit.dart';
import 'package:sel3_app/Features/profile/ui/widgets/personal_details_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});
  static const String routeName = '/PersonalDetailsView';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserDataCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              UploadUserPicCubit(getIt.get<UploadUserPicRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              UpdateUserPicCubit(getIt.get<UpdateUserPicRepoImpl>()),
        ),
      ],
      child: BlocConsumer<UpdateUserPicCubit, UpdateUserPicState>(
        listener: (context, state) {
          if (state is UpdateUserPicSuccessState) {}
        },
        builder: (context, state) {
          return const Scaffold(
            body: PersonalDetailsViewBody(),
          );
        },
      ),
    );
  }
}
