import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20special%20advertisements/get_special_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SpecialAdvertisementsViewBody extends StatefulWidget {
  const SpecialAdvertisementsViewBody({super.key});

  @override
  State<SpecialAdvertisementsViewBody> createState() =>
      _SpecialAdvertisementsViewBodyState();
}

class _SpecialAdvertisementsViewBodyState
    extends State<SpecialAdvertisementsViewBody> {
  @override
  void initState() {
    context.read<GetSpecialAdvertisementsCubit>().getSpecialAdvertisements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الاعلانات المميزة',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:
          BlocBuilder<
            GetSpecialAdvertisementsCubit,
            GetSpecialAdvertisementsState
          >(
            builder: (context, state) {
              if (state is GetSpecialAdvertisementsSuccessState) {
                return GridView.builder(
                  itemCount: state.specialAdvertisements.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: (1.sw / 0.66.sh),
                  ),
                  itemBuilder: (context, index) => AdvertiseItem(
                    advertiseModel: state.specialAdvertisements[index],
                  ),
                );
              } else if (state is GetSpecialAdvertisementsFailureState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: (1.sw / 0.66.sh),
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
          ),
    );
  }
}
