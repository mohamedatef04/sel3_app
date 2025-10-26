import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/favourites/ui/views/favourites_view.dart';
import 'package:sel3_app/Features/home/logic/cubits/nav%20bar/nav_bar_cubit.dart';
import 'package:sel3_app/Features/home/ui/views/home_view.dart';
import 'package:sel3_app/Features/home/ui/widgets/convex_bottom_bar.dart';
import 'package:sel3_app/Features/profile/ui/views/profile_view.dart';
import 'package:sel3_app/Features/publish_advertise/ui/views/publish_advertise_view.dart';

class MainHomeViewBody extends StatefulWidget {
  const MainHomeViewBody({super.key});

  @override
  State<MainHomeViewBody> createState() => _MainHomeViewBodyState();
}

class _MainHomeViewBodyState extends State<MainHomeViewBody> {
  final List<Widget> pages = [
    const HomeView(),
    const FavouritesView(),
    const PublishAdvertiseView(),

    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarCubit, NavBarState>(
      listener: (context, state) {
        if (state is NavBarIndexChanged) {
        } else {}
      },
      builder: (context, state) {
        return Scaffold(
          body: pages[context.read<NavBarCubit>().currentIndex],
          bottomNavigationBar: const ConvexBottomBar(),
        );
      },
    );
  }
}
