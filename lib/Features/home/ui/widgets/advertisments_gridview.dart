import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20all%20advertisments/get_all_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdvertismentsGridview extends StatefulWidget {
  const AdvertismentsGridview({super.key});

  @override
  State<AdvertismentsGridview> createState() => _AdvertismentsGridviewState();
}

class _AdvertismentsGridviewState extends State<AdvertismentsGridview> {
  @override
  void initState() {
    context.read<GetAllAdvertisementsCubit>().getAllAdvertisements(
      category: 'select=*',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAdvertisementsCubit, GetAllAdvertisementsState>(
      builder: (context, state) {
        if (state is GetAllAdvertisementsSuccessState) {
          return SliverGrid.builder(
            itemCount: state.allAdvertisementsList.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: (1.sw / 0.66.sh),
            ),
            itemBuilder: (context, index) => AdvertiseItem(
              advertiseModel: state.allAdvertisementsList[index],
            ),
          );
        } else if (state is GetAllAdvertisementsEmptyState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 200.h,
              child: Column(
                children: [
                  Text(
                    'لا يوجد اعلانات',
                    style: AppStyles.black24,
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetAllAdvertisementsFailureState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return SliverGrid.builder(
            itemCount: 4,
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
          );
        }
      },
    );
  }
}
