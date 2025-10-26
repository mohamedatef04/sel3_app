import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/change_password_view.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          ChangePasswordView.routeName,
        ); // Navigate to the forget password screen
      },
      child: Text(
        'نسيت كلمة المرور؟',
        style: AppStyles.white16.copyWith(
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
