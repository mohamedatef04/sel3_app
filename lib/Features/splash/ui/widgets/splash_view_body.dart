import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_in_view.dart';
import 'package:sel3_app/Features/home/ui/views/main_home_view.dart';
import 'package:sel3_app/Features/on_boarding/ui/views/onboarding_view.dart';
import 'package:sel3_app/core/services/shared_prefrences_service.dart';
import 'package:sel3_app/core/services/supabase_auth_service.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      bool isSignedIn = await SupabaseAuthService().isSignedIn();
      bool isFirst = await SharedPrefrenceService.getBool('isFirst');
      if (isSignedIn) {
        GoRouter.of(context).pushReplacement(
          MainHomeView.routeName,
        );
      } else {
        if (isFirst) {
          GoRouter.of(context).pushReplacement(
            SignInView.routeName,
          );
        } else {
          GoRouter.of(context).pushReplacement(
            OnboardingView.routeName,
          );
        }
        // Navigate to OnboardingView after 2 seconds
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                Assets.imagesIcon,
                width: 200.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
