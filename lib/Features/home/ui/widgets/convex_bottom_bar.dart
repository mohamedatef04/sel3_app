import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/home/logic/cubits/nav%20bar/nav_bar_cubit.dart';
import 'package:sel3_app/core/theme/app_colors.dart';

class ConvexBottomBar extends StatelessWidget {
  const ConvexBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.flip,
      backgroundColor: AppColors.whiteColor,
      color: AppColors.greyColor,
      activeColor: AppColors.primaryColor,
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.favorite, title: 'favorites'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      initialActiveIndex: 0,
      onTap: (index) {
        context.read<NavBarCubit>().changeIndex(index);
      },
    );
  }
}
