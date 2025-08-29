import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class SenderMessageBubble extends StatelessWidget {
  final String message;
  const SenderMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),
            topLeft: Radius.circular(15.r),
            bottomLeft: Radius.circular(15.r),
          ),
        ),
        child: Text(
          message,
          style: AppStyles.black18.copyWith(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
