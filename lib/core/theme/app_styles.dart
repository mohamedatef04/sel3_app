import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';

class AppStyles {
  static TextStyle black24 = TextStyle(
    fontSize: 36.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'IBM Plex Sans Arabic',
  );
  static TextStyle black18 = TextStyle(
    fontSize: 18.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'IBM Plex Sans Arabic',
  );
  static TextStyle white16 = TextStyle(
    fontSize: 16.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'IBM Plex Sans Arabic',
  );
}
