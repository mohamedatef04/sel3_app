import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/verify_otp_during_change_pass.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              spacing: 10.h,
              children: [
                Image.asset(Assets.imagesIcon, width: 200.w),
                Text(
                  'استعادة كلمة المرور',
                  style: AppStyles.black24,
                ),
                Text(
                  'قم بادخال البريد الالكتروني لاستعاده كلمة المرور',
                  style: AppStyles.black18.copyWith(color: Colors.grey),
                ),
                const CustomTextFormField(
                  hintText: 'البريد الالكتروني',
                  prefixIcon: Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),

                CustomButton(
                  child: Text(
                    'استعادة كلمة المرور',
                    style: AppStyles.white16,
                  ),

                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(VerifyOtpDuringChangePass.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
