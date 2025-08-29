import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20all%20advertisments/get_all_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20special%20advertisements/get_special_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/home_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllAdvertisementsCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetSpecialAdvertisementsCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
