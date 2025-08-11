import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class AdvertiseMoreDetailsWidget extends StatelessWidget {
  const AdvertiseMoreDetailsWidget({
    super.key,
  });

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
              'منذ 5 ساعات',
              style: AppStyles.black24.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        Text(
          'وصف الاعلان وصف الاعلان وصف الاعلان وصف الاعلان',
          style: AppStyles.black24.copyWith(fontSize: 22.sp),
        ),
      ],
    );
  }
}
