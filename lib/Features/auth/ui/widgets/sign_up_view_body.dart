import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/already_have_an_account_widget.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_divider.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_header_text.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/Features/auth/ui/widgets/google_sign_widget.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.imagesIcon,
                      width: 200.w,
                    ),
                  ),

                  const CustomHeaderText(
                    title: 'سجّل الآن مجاناً!',
                    subtitle:
                        'ادخل البيانات التالية لانشاء حساب جديد، ابدء الان انه مجاني!',
                  ),
                  Text(
                    'الاسم الكامل',
                    style: AppStyles.white16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const CustomTextFormField(
                    hintText: ' الاسم الكامل',
                    prefixIcon: Icon(Icons.person_outline),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  Text(
                    'حساب الايميل',
                    style: AppStyles.white16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const CustomTextFormField(
                    hintText: 'البريد الالكتروني',
                    prefixIcon: Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Text(
                    'رقم الهاتف',
                    style: AppStyles.white16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const CustomTextFormField(
                    hintText: ' رقم الهاتف',
                    prefixIcon: Icon(Icons.phone_outlined),
                    keyboardType: TextInputType.phone,
                  ),
                  Text(
                    'كلمة المرور',
                    style: AppStyles.white16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const CustomTextFormField(
                    hintText: 'كلمة المرور',
                    prefixIcon: Icon(Icons.lock_outline),
                    obscureText: true,
                  ),

                  CustomButton(
                    text: 'انشئ حساباً',
                    onPressed: () {
                      // Handle sign-in logic here
                    },
                  ),
                  const AlreadyHaveAnAccountWidget(),
                  const CustomDivider(),
                  const GoogleSignWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
