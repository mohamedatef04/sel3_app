import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/otp_widget.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class VerifyAccountViewBody extends StatelessWidget {
  const VerifyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Image.asset(Assets.imagesIcon, width: 200.w),
              Text(
                'ادخل رمز التحقق',
                style: AppStyles.black24,
              ),
              Text(
                'لقد قمنا بارسال رمز التاكيد للبريد الالكتروني التالي',
                style: AppStyles.black18.copyWith(color: Colors.grey),
              ),
              Text('O4d6b@example.com', style: AppStyles.black18),

              OtpInputWidget(
                onCompleted: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
