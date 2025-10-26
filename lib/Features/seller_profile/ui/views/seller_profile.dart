import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_seller_data_cubit.dart';
import 'package:sel3_app/Features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/seller_profile/data/repos/seller_profile_repo_impl.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/get_rater_info_cubit.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/get_seller_advertisements_cubit/get_seller_advertisements_cubit.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/post_a_new_rate_cubit/post_a_new_rate_cubit.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/get_seller_rates_cubit/get_seller_rates_cubit.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/seller_profile_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class SellerProfileView extends StatelessWidget {
  const SellerProfileView({super.key, required this.sellerId});
  static const routeName = '/SellerProfile';
  final String sellerId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetSellerAdvertisementsCubit(getIt.get<SellerProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouriteItemsCubit(getIt.get<FavouritesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetSellerRatesCubit(getIt.get<SellerProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              PostANewRateCubit(getIt.get<SellerProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetSellerDataCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetRaterInfoCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: Scaffold(
        body: SellerProfileViewBody(
          sellerId: sellerId,
        ),
      ),
    );
  }
}
