import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/logic/cubits/sign%20in%20cubit/sign_in_cubit.dart';
import 'package:sel3_app/Features/auth/ui/widgets/csutom_text.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_divider.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_dont_have_an_account_widget.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/Features/auth/ui/widgets/forget_password_widget.dart';
import 'package:sel3_app/Features/auth/ui/widgets/google_sign_widget.dart';
import 'package:sel3_app/Features/home/ui/views/main_home_view.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
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
                    CustomTextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال البريد الإلكتروني';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'الرجاء إدخال بريد إلكتروني صالح';
                        }
                        return null;
                      },
                      hintText: 'البريد الالكتروني',
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
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
                        }

                        return null;
                      },
                      hintText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: isObscure
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                      obscureText: isObscure,
                    ),
                    const ForgetPasswordWidget(),
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if (state is SignInSuccessState) {
                          GoRouter.of(
                            context,
                          ).pushReplacement(MainHomeView.routeName);
                        } else if (state is SignInFailureState) {
                          showSnakBar(
                            context,
                            message: state.errorMessage,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          child: state is SignInLoadingState
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'تسجيل الدخول',
                                  style: AppStyles.white16,
                                ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.read<SignInCubit>().signIn(
                                email: emailController.text,
                                password: passwordController.text,
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
                    const CustomDontHaveAnAccountWidget(),
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
