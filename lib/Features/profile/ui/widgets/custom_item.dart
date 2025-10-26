import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });
  final String title;
  final Icon icon;
  final void Function()? onPressed;

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
          spacing: 5.w,
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
            const Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
