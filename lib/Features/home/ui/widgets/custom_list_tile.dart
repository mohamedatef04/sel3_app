import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            spacing: 10.w,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(Assets.imagesLogo),
              ),

              Column(
                children: [
                  Text(
                    ' اهلا بك !',
                    style: AppStyles.black24.copyWith(fontSize: 22.sp),
                  ),
                  Text(
                    'محمد عاظف علي',
                    style: AppStyles.black18.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: 10.w,
            children: [
              Image.asset(Assets.imagesSearch, width: 30.w, height: 30.h),
              Image.asset(
                Assets.imagesNotificationBell,
                width: 30.w,
                height: 30.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
