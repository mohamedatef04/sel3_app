import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/logic/cubits/send%20phone%20otp/send_phone_otp_cubit.dart';
import 'package:sel3_app/Features/auth/ui/views/verify_otp_during_change_pass.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SafeArea(
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
                    'قم بادخال  رقم الهاتف لاستعاده كلمة المرور',
                    style: AppStyles.black18.copyWith(color: Colors.grey),
                  ),
                  CustomTextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء ادخال رقم الهاتف';
                      }
                      if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                        return 'الرجاء ادخال رقم هاتف صحيح';
                      }
                      return null;
                    },
                    hintText: ' رقم الهاتف',
                    prefixIcon: const Icon(Icons.phone),
                    keyboardType: TextInputType.number,
                  ),

                  BlocConsumer<SendPhoneOtpCubit, SendPhoneOtpState>(
                    listener: (context, state) {
                      if (state is SendPhoneOtpSuccessState) {
                        showSnakBar(
                          context,
                          message: 'تم ارسال رمز التحقق بنجاح',
                        );
                        GoRouter.of(
                          context,
                        ).push(
                          VerifyOtpDuringChangePass.routeName,
                          extra: phoneController.text.trim().toString(),
                        );
                      } else if (state is SendPhoneOtpFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        child: state is SendPhoneOtpLoadingState
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'استعادة كلمة المرور',
                                style: AppStyles.white16,
                              ),

                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<SendPhoneOtpCubit>().sendPhoneOtp(
                              phone: '+20${phoneController.text.trim()}',
                            );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                            return;
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
