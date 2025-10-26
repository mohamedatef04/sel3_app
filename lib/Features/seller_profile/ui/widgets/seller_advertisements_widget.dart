import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/get_seller_advertisements_cubit/get_seller_advertisements_cubit.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SellerAdvertisementsWidget extends StatefulWidget {
  const SellerAdvertisementsWidget({super.key, required this.sellerId});
  final String sellerId;

  @override
  State<SellerAdvertisementsWidget> createState() =>
      _SellerAdvertisementsWidgetState();
}

class _SellerAdvertisementsWidgetState
    extends State<SellerAdvertisementsWidget> {
  @override
  void initState() {
    context.read<GetSellerAdvertisementsCubit>().getSellerAdvertisements(
      sellerId: widget.sellerId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetSellerAdvertisementsCubit,
      GetSellerAdvertisementsState
    >(
      builder: (context, state) {
        if (state is GetSellerAdvertisementsSuccessState) {
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: (1.sw / 0.69.sh),
              ),
              itemBuilder: (context, index) => AdvertiseItem(
                advertiseModel: state.advertisementsList[index],
              ),
              itemCount: state.advertisementsList.length,
            ),
          );
        } else if (state is GetSellerAdvertisementsEmptyState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لا يوجد اعلانات',
                style: AppStyles.black24.copyWith(fontSize: 22.sp),
              ),
            ],
          );
        } else if (state is GetSellerAdvertisementsFailureState) {
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
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: (1.sw / 0.69.sh),
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
