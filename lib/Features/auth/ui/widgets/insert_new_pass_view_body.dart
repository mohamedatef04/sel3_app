import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/congrates_view.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class InsertNewPassViewBody extends StatelessWidget {
  const InsertNewPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              spacing: 10.h,
              children: [
                Image.asset(Assets.imagesIcon, width: 200.w),
                Text(
                  'ادخل كلمة المرور الجديدة',
                  textAlign: TextAlign.center,
                  style: AppStyles.black24,
                ),
                Text(
                  'قم بادخال كلمة المرور الجديدة ويجب ان تكون مكونه من 8 خانات!',
                  textAlign: TextAlign.center,
                  style: AppStyles.black18.copyWith(color: Colors.grey),
                ),
                const CustomTextFormField(
                  suffixIcon: Icon(Icons.visibility_off),
                  hintText: 'كلمة المرور الجديدة',
                ),
                const CustomTextFormField(
                  suffixIcon: Icon(Icons.visibility_off),
                  hintText: 'تأكيد كلمة المرور الجديدة',
                ),

                CustomButton(
                  child: Text(
                    'تغيير كلمة المرور',
                    style: AppStyles.white16,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(CongratesView.routeName);
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
