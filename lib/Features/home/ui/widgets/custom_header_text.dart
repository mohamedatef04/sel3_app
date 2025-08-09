import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'المنتجات المميزة',
          style: AppStyles.black24.copyWith(fontSize: 22.sp),
        ),
        const Spacer(),
        Text(
          'المزيد',
          style: AppStyles.black18.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
