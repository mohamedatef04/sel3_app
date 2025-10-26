import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/favourites/logic/cubits/get_favourite_items/get_favourite_items_cubit.dart';
import 'package:sel3_app/Features/favourites/ui/widgets/fav_item.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavList extends StatefulWidget {
  const FavList({super.key});

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  void initState() {
    context.read<GetFavouriteItemsCubit>().getFavouriteItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouriteItemsCubit, GetFavouriteItemsState>(
      builder: (context, state) {
        if (state is GetFavouriteItemsSuccessState) {
          return ListView.builder(
            itemCount: state.myFavouriteItems.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: FavItem(
                advertiseModel: state.myFavouriteItems[index],
              ),
            ),
          );
        } else if (state is GetFavouriteItemsEmptyState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'لا يوجد اعلانات في المفضلة',
                  style: AppStyles.black24.copyWith(fontSize: 22.sp),
                ),
              ),
            ],
          );
        } else if (state is GetFavouriteItemsAfterRemove) {
          return ListView.builder(
            itemCount: state.myFavouriteItems.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: FavItem(
                advertiseModel: state.myFavouriteItems[index],
              ),
            ),
          );
        } else if (state is GetFavouriteItemsFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Skeletonizer(
                enabled: true,
                child: FavItem(
                  advertiseModel: AdvertiseModel.placeHolder(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
