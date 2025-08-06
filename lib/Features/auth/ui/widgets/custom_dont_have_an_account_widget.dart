import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_up_view.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomDontHaveAnAccountWidget extends StatelessWidget {
  const CustomDontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ليس لديك حساب؟  ',
          style: AppStyles.black18.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(SignUpView.routeName);
          },
          child: Text(
            'انشئ حساب جديد',
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
