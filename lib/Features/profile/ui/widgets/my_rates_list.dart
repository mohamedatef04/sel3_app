import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/profile/logic/cubits/get_my_rates_cubit/get_my_rates_cubit.dart';
import 'package:sel3_app/Features/profile/ui/widgets/rate_item.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyRatesList extends StatefulWidget {
  const MyRatesList({super.key});

  @override
  State<MyRatesList> createState() => _MyRatesListState();
}

class _MyRatesListState extends State<MyRatesList> {
  @override
  void initState() {
    context.read<GetMyRatesCubit>().getMyRates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyRatesCubit, GetMyRatesState>(
      builder: (context, state) {
        if (state is GetMyRatesSuccessState) {
          return ListView.builder(
            padding: EdgeInsets.all(12.w),
            itemCount: state.myRatesList.fold<int>(
              0,
              (sum, e) => sum + e.rates.length,
            ),
            itemBuilder: (context, index) {
              int currentIndex = index;
              for (var model in state.myRatesList) {
                if (currentIndex < model.rates.length) {
                  final singleRate = model.rates[currentIndex];
                  return RateItem(
                    rateModel: model,
                    singleRate: singleRate,
                  );
                } else {
                  currentIndex -= model.rates.length;
                }
              }
              return const SizedBox.shrink(); // fallback
            },
          );
        } else if (state is GetMyRatesEmptyState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لا يوجد تقييمات',
                style: AppStyles.black18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        } else if (state is GetMyRatesFailureState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.errorMessage,
                textAlign: TextAlign.center,
                style: AppStyles.black18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(12.w),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                child: RateItem(
                  rateModel: RateModel.fromPlaceholder(),
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
