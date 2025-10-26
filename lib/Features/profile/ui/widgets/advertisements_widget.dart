import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';
import 'package:sel3_app/Features/profile/logic/cubits/show_my_advertisements_cubit/show_my_advertisements_cubit.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdvertisementsWidget extends StatefulWidget {
  const AdvertisementsWidget({super.key});

  @override
  State<AdvertisementsWidget> createState() => _AdvertisementsWidgetState();
}

class _AdvertisementsWidgetState extends State<AdvertisementsWidget> {
  @override
  void initState() {
    context.read<ShowMyAdvertisementsCubit>().getMyAdvertisements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowMyAdvertisementsCubit, ShowMyAdvertisementsState>(
      builder: (context, state) {
        if (state is ShowMyAdvertisementsSuccessState) {
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: (1.sw / 0.69.sh),
              ),
              itemCount: state.myAdvertisementsList.length,
              itemBuilder: (context, index) {
                return AdvertiseItem(
                  advertiseModel: state.myAdvertisementsList[index],
                );
              },
            ),
          );
        } else if (state is ShowMyAdvertisementsEmptyState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لا يوجد اعلانات',
                style: AppStyles.black24.copyWith(fontSize: 22.sp),
              ),
            ],
          );
        } else if (state is ShowMyAdvertisementsFailureState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.errorMessage,
                textAlign: TextAlign.center,
                style: AppStyles.black24.copyWith(fontSize: 22.sp),
              ),
            ],
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.69,
              ),
              itemBuilder: (context, index) => Skeletonizer(
                enabled: true,
                child: AdvertiseItem(
                  advertiseModel: AdvertiseModel.placeHolder(),
                ),
              ),
              itemCount: 4,
            ),
          );
        }
      },
    );
  }
}
