import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/get_rater_info_cubit.dart';
import 'package:sel3_app/core/functions/convert_time.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class RateItemForSellerWidget extends StatefulWidget {
  const RateItemForSellerWidget({
    super.key,
    required this.singleRate,
  });

  final SingleRate singleRate;

  @override
  State<RateItemForSellerWidget> createState() =>
      _RateItemForSellerWidgetState();
}

class _RateItemForSellerWidgetState extends State<RateItemForSellerWidget> {
  @override
  void initState() {
    context.read<GetRaterInfoCubit>().getRaterInfo(
      userId: widget.singleRate.from,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GetRaterInfoCubit, GetRaterInfoState>(
            builder: (context, state) {
              if (state is GetRaterInfoSuccessState) {
                return Row(
                  spacing: 10.w,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          state.userModel.image ??
                          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),

                    Text(
                      state.userModel.name,
                      style: AppStyles.black18,
                    ),
                  ],
                );
              } else {
                return Text('');
              }
            },
          ),
          Text(
            widget.singleRate.comment,
            style: AppStyles.black18.copyWith(color: AppColors.primaryColor),
          ),

          Text(
            'التقييم: ${widget.singleRate.rateValue} ⭐',
            style: AppStyles.black18,
          ),

          Text(
            timeAgoArabic(widget.singleRate.date!),
            style: AppStyles.black18.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
