import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/logic/cubits/create%20account%20cubit/create_account_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/already_have_an_account_widget.dart';
import 'package:sel3_app/Features/auth/ui/widgets/csutom_text.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_divider.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/Features/auth/ui/widgets/google_sign_widget.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool obsecureText = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SafeArea(
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

                    const CsutomText(
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
                    CustomTextFormField(
                      controller: fullNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال الاسم الكامل';
                        }
                        return null;
                      },
                      hintText: ' الاسم الكامل',
                      prefixIcon: const Icon(Icons.person_outline),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    Text(
                      'حساب الايميل',
                      style: AppStyles.white16.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال البريد الالكتروني';
                        } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value)) {
                          return 'الرجاء إدخال بريد إلكتروني صالح';
                        }
                        return null;
                      },
                      hintText: 'البريد الالكتروني',
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Text(
                      'رقم الهاتف',
                      style: AppStyles.white16.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم الهاتف';
                        } else if (!RegExp(
                          r'^\+?[0-9]{10,15}$',
                        ).hasMatch(value)) {
                          return 'الرجاء إدخال رقم هاتف صالح';
                        }
                        return null;
                      },
                      hintText: ' رقم الهاتف',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      keyboardType: TextInputType.phone,
                    ),
                    Text(
                      'كلمة المرور',
                      style: AppStyles.white16.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال كلمة المرور';
                        } else if (value.length < 6) {
                          return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                        } else if (!RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$',
                        ).hasMatch(value)) {
                          return 'يجب أن تحتوي كلمة المرور على حرف كبير وحرف صغير ورقم';
                        }
                        return null;
                      },
                      hintText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        icon: obsecureText
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                      obscureText: obsecureText,
                    ),

                    BlocConsumer<CreateAccountCubit, CreateAccountState>(
                      listener: (context, state) {
                        if (state is CreateAccountSuccessState) {
                          showSnakBar(
                            context,
                            message: 'تم انشاء الحساب بنجاح',
                          );
                          Navigator.pop(context);
                        } else if (state is CreateAccountFailureState) {
                          showSnakBar(
                            context,
                            message: state.errorMessage,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          child: state is CreateAccountLoadingState
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'إنشاء حساب',
                                  style: AppStyles.white16,
                                ),

                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              context
                                  .read<CreateAccountCubit>()
                                  .createNewAccount(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    data: {
                                      'user_name': fullNameController.text
                                          .trim(),
                                      'user_email': emailController.text.trim(),
                                      'user_phone': phoneController.text.trim(),
                                    },
                                  );
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        );
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
      ),
    );
  }
}
