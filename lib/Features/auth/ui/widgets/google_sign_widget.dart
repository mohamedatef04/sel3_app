import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class GoogleSignWidget extends StatelessWidget {
  const GoogleSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' تسجيل الدخول باستخدام جوجل  ', style: AppStyles.black18),

            Image.asset(
              Assets.imagesGoogleIcon,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
