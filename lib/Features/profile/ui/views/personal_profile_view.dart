import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_seller_data_cubit.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/profile/data/repos/profile_repo_impl.dart';
import 'package:sel3_app/Features/profile/logic/cubits/get_my_rates_cubit/get_my_rates_cubit.dart';
import 'package:sel3_app/Features/profile/logic/cubits/show_my_advertisements_cubit/show_my_advertisements_cubit.dart';
import 'package:sel3_app/Features/profile/ui/widgets/personal_profile_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class PersonalProfileView extends StatelessWidget {
  const PersonalProfileView({super.key});
  static const routeName = '/personal-profile';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserDataCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetSellerDataCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              ShowMyAdvertisementsCubit(getIt.get<ProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouriteItemsCubit(getIt.get<FavouritesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetMyRatesCubit(getIt.get<ProfileRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: PersonalProfileViewBody(),
      ),
    );
  }
}
