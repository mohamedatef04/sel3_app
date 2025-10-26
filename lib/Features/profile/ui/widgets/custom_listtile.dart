import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key, required this.title, required this.icon});
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
          color: AppColors.ligthWhiteColor,
        ),
        child: Row(
          spacing: 10.w,
          children: [
            Icon(
              icon.icon,
              color: AppColors.primaryColor,
              size: 30.sp,
            ),
            Text(
              title,
              style: AppStyles.black18,
            ),
          ],
        ),
      ),
    );
  }
}
