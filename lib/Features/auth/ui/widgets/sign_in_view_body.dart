import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_divider.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_dont_have_an_account_widget.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_header_text.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/Features/auth/ui/widgets/forget_password_widget.dart';
import 'package:sel3_app/Features/auth/ui/widgets/google_sign_widget.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

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
                    title: 'أهلا بعودتك!',
                    subtitle:
                        'ادخل البيانات التالية لتتمكن من الوصول إلى حسابك!',
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
                  const ForgetPasswordWidget(),
                  CustomButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      // Handle sign-in logic here
                    },
                  ),
                  const CustomDontHaveAnAccountWidget(),
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
