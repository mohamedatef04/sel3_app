import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });
  final String title;
  final String? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.black24.copyWith(fontSize: 22.sp),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subtitle ?? '',
            textAlign: TextAlign.center,
            style: AppStyles.white16.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
