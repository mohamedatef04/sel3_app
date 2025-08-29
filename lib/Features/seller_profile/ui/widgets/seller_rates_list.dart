import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/get_seller_rates_cubit/get_seller_rates_cubit.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/rate_item_for_seller_widget.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SellerRatesList extends StatefulWidget {
  const SellerRatesList({super.key, required this.sellerId});
  final String sellerId;

  @override
  State<SellerRatesList> createState() => _SellerRatesListState();
}

class _SellerRatesListState extends State<SellerRatesList> {
  @override
  void initState() {
    context.read<GetSellerRatesCubit>().getSellerRates(
      sellerId: widget.sellerId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSellerRatesCubit, GetSellerRatesState>(
      builder: (context, state) {
        if (state is GetSellerRatesSuccessState) {
          return ListView.builder(
            itemCount: state.myRatesList.length,
            itemBuilder: (context, index) {
              return RateItemForSellerWidget(
                singleRate: state.myRatesList[index],
              );
            },
          );
        } else if (state is GetSellerRatesEmptyState) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'لا يوجد تقييمات',
                  style: AppStyles.black24.copyWith(fontSize: 22.sp),
                ),
              ],
            ),
          );
        } else if (state is GetSellerRatesFailureState) {
          return Text(state.errorMessage.toString());
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                child: RateItemForSellerWidget(
                  singleRate: SingleRate.fromPlaceholder(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
