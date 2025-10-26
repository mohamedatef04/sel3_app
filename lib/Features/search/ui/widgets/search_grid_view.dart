import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';
import 'package:sel3_app/Features/search/logic/cubits/search/search_cubit.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is AllSearchItemsSuccessState) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: (1.sw / 0.69.sh),
            ),
            itemCount: state.advertismentsList.length,
            itemBuilder: (context, index) => AdvertiseItem(
              advertiseModel: state.advertismentsList[index],
            ),
          );
        } else if (state is SearchItemsSuccessState) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: (1.sw / 0.69.sh),
            ),
            itemCount: state.advertismentsList.length,
            itemBuilder: (context, index) => AdvertiseItem(
              advertiseModel: state.advertismentsList[index],
            ),
          );
        } else if (state is SearchEmptyState) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا يوجد نتائج',
                  style: AppStyles.black18,
                ),
              ],
            ),
          );
        } else if (state is SearchFailureState) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage,
                  style: AppStyles.black18,
                ),
              ],
            ),
          );
        } else {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: (1.sw / 0.69.sh),
            ),
            itemCount: 4,
            itemBuilder: (context, index) => Skeletonizer(
              enabled: true,
              child: AdvertiseItem(
                advertiseModel: AdvertiseModel.placeHolder(),
              ),
            ),
          );
        }
      },
    );
  }
}
