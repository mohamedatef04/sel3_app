import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_in_view.dart';
import 'package:sel3_app/Features/profile/ui/views/personal_details_view.dart';
import 'package:sel3_app/Features/profile/ui/views/personal_profile_view.dart';
import 'package:sel3_app/Features/profile/ui/widgets/custom_item.dart';
import 'package:sel3_app/Features/profile/ui/widgets/user_pic_and_details_widget.dart';
import 'package:sel3_app/core/services/supabase_auth_service.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  Future<void> confirmSignOut(BuildContext context) async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('تأكيد تسجيل الخروج'),
          content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Cancel
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () async {
                await SupabaseAuthService().signOut();
                GoRouter.of(context).pushReplacement(SignInView.routeName);
              }, // Confirm
              child: const Text('تسجيل الخروج'),
            ),
          ],
        );
      },
    );

    if (shouldSignOut == true) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: UserPicAndDetailsWidget(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  spacing: 10.h,
                  children: [
                    CustomItem(
                      title: 'المعلومات الشخصية',
                      icon: const Icon(
                        Icons.person,
                      ),
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).push(PersonalDetailsView.routeName);
                      },
                    ),
                    CustomItem(
                      title: 'ملفي الشخصي',
                      icon: const Icon(
                        Icons.person_2,
                      ),
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).push(PersonalProfileView.routeName);
                      },
                    ),
                    CustomItem(
                      title: 'الاشعارات',
                      icon: const Icon(
                        Icons.notifications,
                      ),
                      onPressed: () {},
                    ),
                    CustomItem(
                      title: 'اللغة',
                      icon: const Icon(
                        Icons.language,
                      ),
                      onPressed: () {},
                    ),
                    CustomItem(
                      title: 'تسجيل الخروج',
                      icon: const Icon(
                        Icons.logout,
                      ),
                      onPressed: () => confirmSignOut(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
