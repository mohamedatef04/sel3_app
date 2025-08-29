import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/logic/cubits/verify%20otp/verify_otp_cubit.dart';
import 'package:sel3_app/Features/auth/ui/views/insert_new_pass_view.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/otp_widget.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class VerifyOtpDuringChangePassViewBody extends StatefulWidget {
  const VerifyOtpDuringChangePassViewBody({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  State<VerifyOtpDuringChangePassViewBody> createState() =>
      _VerifyOtpDuringChangePassViewBodyState();
}

class _VerifyOtpDuringChangePassViewBodyState
    extends State<VerifyOtpDuringChangePassViewBody> {
  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            spacing: 10.h,
            children: [
              Image.asset(Assets.imagesIcon, width: 200.w),
              Text(
                'ادخل رمز التحقق',
                style: AppStyles.black24,
              ),
              Text(
                'لقد قمنا بارسال رمز التاكيد الى رقم الهاتف التالي',
                style: AppStyles.black18.copyWith(color: Colors.grey),
              ),
              Text(widget.phoneNumber, style: AppStyles.black18),

              OtpInputWidget(
                onCompleted: (value) {
                  setState(() {
                    otpCode = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
                listener: (context, state) {
                  if (state is VerifyOtpSuccessState) {
                    showSnakBar(context, message: 'تم التحقق بنجاح');
                    GoRouter.of(context).push(InsertNewPassView.routeName);
                  } else if (state is VerifyOtpFailureState) {
                    showSnakBar(context, message: state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    child: state is VerifyOtpLoadingState
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'تحقق',
                            style: AppStyles.white16,
                          ),
                    onPressed: () {
                      context.read<VerifyOtpCubit>().verifyOtp(
                        otp: otpCode,
                        phone: '+20${widget.phoneNumber}',
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
