import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20special%20advertisements/get_special_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SpecialAdvertismentsList extends StatefulWidget {
  const SpecialAdvertismentsList({super.key});

  @override
  State<SpecialAdvertismentsList> createState() =>
      _SpecialAdvertismentsListState();
}

class _SpecialAdvertismentsListState extends State<SpecialAdvertismentsList> {
  @override
  void initState() {
    context.read<GetSpecialAdvertisementsCubit>().getSpecialAdvertisements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetSpecialAdvertisementsCubit,
      GetSpecialAdvertisementsState
    >(
      builder: (context, state) {
        if (state is GetSpecialAdvertisementsSuccessState) {
          return SizedBox(
            height: 230.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.specialAdvertisements.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: AdvertiseItem(
                    advertiseModel: state.specialAdvertisements[index],
                  ),
                );
              },
            ),
          );
        } else if (state is GetSpecialAdvertisementsFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return SizedBox(
            height: 230.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Skeletonizer(
                    enabled: true,
                    child: AdvertiseItem(
                      advertiseModel: AdvertiseModel.placeHolder(),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
