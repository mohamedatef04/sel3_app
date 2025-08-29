import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/core/functions/convert_time.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class AdvertiseMoreDetailsWidget extends StatelessWidget {
  const AdvertiseMoreDetailsWidget({
    super.key,
    required this.advertiseModel,
  });
  final AdvertiseModel advertiseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          children: [
            Text(
              'وصف الاعلان',
              style: AppStyles.black24.copyWith(
                fontSize: 22.sp,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              timeAgoArabic(advertiseModel.timeCreated),
              style: AppStyles.black24.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        Text(
          advertiseModel.description,
          style: AppStyles.black24.copyWith(fontSize: 22.sp),
        ),
      ],
    );
  }
}
