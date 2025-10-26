import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:sel3_app/Features/search/logic/cubits/search/search_cubit.dart';
import 'package:sel3_app/Features/search/ui/widgets/search_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(getIt<SearchRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouriteItemsCubit(getIt<FavouritesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddToFavCubit(getIt<FavouritesRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
