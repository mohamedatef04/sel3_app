import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20special%20advertisements/get_special_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/special_advertisements_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class SpecialAdvertisementsView extends StatelessWidget {
  const SpecialAdvertisementsView({super.key});
  static const String routeName = '/SpecialAdvertisementsView';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetSpecialAdvertisementsCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddToFavCubit(getIt.get<FavouritesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouriteItemsCubit(getIt.get<FavouritesRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: SpecialAdvertisementsViewBody(),
      ),
    );
  }
}
