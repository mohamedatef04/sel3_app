import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/home/logic/cubits/nav%20bar/nav_bar_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/main_home_view_body.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  static const String routeName = '/mainHomeView';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) =>
              GetUserDataCubit(getIt.get<AuthRepoImpl>())..getUserData(),
        ),
        BlocProvider(
          create: (context) => AddToFavCubit(getIt.get<FavouritesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouriteItemsCubit(getIt.get<FavouritesRepoImpl>()),
        ),
      ],
      child: Scaffold(
        body: BlocConsumer<GetFavouriteItemsCubit, GetFavouriteItemsState>(
          listener: (context, state) {
            if (state is RemoveFavouriteItemSuccessState) {
              showSnakBar(
                context,
                message: 'تم حذف الاعلان من المفضلة',
              );
            }
          },
          builder: (context, state) {
            return const MainHomeViewBody();
          },
        ),
      ),
    );
  }
}
