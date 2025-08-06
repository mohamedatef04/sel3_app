import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لديك حساب بالفعل؟  ',
          style: AppStyles.black18.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop(); // Navigate back to the previous screen
          },
          child: Text(
            'تسجيل الدخول',
            style: AppStyles.black18.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
