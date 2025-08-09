import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/logic/cubits/nav_bar_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/main_home_view_body.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  static const String routeName = '/mainHomeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: const Scaffold(
        body: MainHomeViewBody(),
      ),
    );
  }
}
