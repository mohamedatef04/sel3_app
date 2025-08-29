import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/logic/cubits/inserts%20new%20pass/insert_new_password_cubit.dart';
import 'package:sel3_app/Features/auth/ui/views/congrates_view.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class InsertNewPassViewBody extends StatefulWidget {
  const InsertNewPassViewBody({super.key});

  @override
  State<InsertNewPassViewBody> createState() => _InsertNewPassViewBodyState();
}

class _InsertNewPassViewBodyState extends State<InsertNewPassViewBody> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: SafeArea(
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
                    CustomTextFormField(
                      controller: newPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء ادخال كلمة المرور';
                        } else if (value.length < 8) {
                          return 'يجب ان تكون كلمة المرور مكونه من 8 خانات على الاقل';
                        } else if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
                        ).hasMatch(value)) {
                          return 'يجب ان تحتوي كلمة المرور على حروف كبيرة وصغيرة ورقم';
                        }

                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: isPasswordVisible,
                      hintText: 'كلمة المرور الجديدة',
                    ),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء تأكيد كلمة المرور';
                        } else if (value != newPasswordController.text) {
                          return 'كلمة المرور غير متطابقة';
                        }
                        return null;
                      },

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: isConfirmPasswordVisible,
                      hintText: 'تأكيد كلمة المرور الجديدة',
                    ),

                    BlocConsumer<
                      InsertNewPasswordCubit,
                      InsertNewPasswordState
                    >(
                      listener: (context, state) {
                        if (state is InsertNewPasswordSuccessState) {
                          GoRouter.of(context).push(
                            CongratesView.routeName,
                          );
                        } else if (state is InsertNewPasswordFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          child: state is InsertNewPasswordLoadingState
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'تغيير كلمة المرور',
                                  style: AppStyles.white16,
                                ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context
                                  .read<InsertNewPasswordCubit>()
                                  .insertNewPassword(
                                    newPassword: newPasswordController.text,
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
      ),
    );
  }
}
