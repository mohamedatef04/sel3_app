import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class CongratesViewBody extends StatelessWidget {
  const CongratesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesCongrates,
              width: 100.w,
            ),
            Text(
              'تهانينا!',
              style: AppStyles.black24,
            ),
            Text(
              'لقد تم تغيير كلمة مرور حسابك بنجاح، يمكنك الان العودة وتسجيل الدخول من جديد!',
              textAlign: TextAlign.center,
              style: AppStyles.black18.copyWith(color: Colors.grey),
            ),

            CustomButton(
              child: Text(
                'العودة لتسجيل الدخول',
                style: AppStyles.white16,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
