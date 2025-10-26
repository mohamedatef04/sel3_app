import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/utils/assets.dart';

class CustomFavWidget extends StatelessWidget {
  const CustomFavWidget({
    super.key,
    required this.advertiseModel,
  });
  final AdvertiseModel advertiseModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouriteItemsCubit, GetFavouriteItemsState>(
      builder: (context, state) {
        bool isFav = false;
        if (state is GetFavouriteItemsSuccessState) {
          for (var element in state.myFavouriteItems) {
            if (element.id == advertiseModel.id) {
              isFav = true;
              break;
            }
          }
        }
        if (state is GetFavouriteItemsAfterRemove) {
          for (var element in state.myFavouriteItems) {
            if (element.id == advertiseModel.id) {
              isFav = true;
              break;
            }
          }
        }

        return GestureDetector(
          onTap: () {
            if (isFav) {
              context.read<GetFavouriteItemsCubit>().removeFavouriteItem(
                advertiseModel.id,
              );
            } else {
              context
                  .read<AddToFavCubit>()
                  .addToFavourites(
                    advertiseId: advertiseModel.id,
                  )
                  .then(
                    (_) => context
                        .read<GetFavouriteItemsCubit>()
                        .getFavouriteItems(),
                  );
            }
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: isFav
                  ? Image.asset(
                      Assets.imagesBlueHeart,
                      width: 30.w,
                      height: 30.h,
                    )
                  : Image.asset(
                      Assets.imagesHeart,
                      color: AppColors.primaryColor,
                      width: 30.w,
                      height: 30.h,
                    ),
            ),
          ),
        );
      },
    );
  }
}
