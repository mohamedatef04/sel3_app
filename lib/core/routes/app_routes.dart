import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/change_password_view.dart';
import 'package:sel3_app/Features/auth/ui/views/congrates_view.dart';
import 'package:sel3_app/Features/auth/ui/views/insert_new_pass_view.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_in_view.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_up_view.dart';
import 'package:sel3_app/Features/auth/ui/views/verify_account_view.dart';
import 'package:sel3_app/Features/auth/ui/views/verify_otp_during_change_pass.dart';
import 'package:sel3_app/Features/favourites/ui/views/favourites_view.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/views/advertise_details_view.dart';
import 'package:sel3_app/Features/home/ui/views/home_view.dart';
import 'package:sel3_app/Features/home/ui/views/main_home_view.dart';
import 'package:sel3_app/Features/home/ui/views/special_advertisements_view.dart';
import 'package:sel3_app/Features/on_boarding/ui/views/onboarding_view.dart';
import 'package:sel3_app/Features/profile/ui/views/personal_details_view.dart';
import 'package:sel3_app/Features/profile/ui/views/personal_profile_view.dart';
import 'package:sel3_app/Features/profile/ui/views/profile_view.dart';
import 'package:sel3_app/Features/seller_profile/ui/views/seller_profile.dart';
import 'package:sel3_app/Features/search/ui/views/search_view.dart';
import 'package:sel3_app/Features/splash/ui/view/splash_view.dart';

import 'package:sel3_app/Features/publish_advertise/ui/views/publish_advertise_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: OnboardingView.routeName,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: SignInView.routeName,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: SignUpView.routeName,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: ChangePasswordView.routeName,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: VerifyAccountView.routeName,
      builder: (context, state) => const VerifyAccountView(),
    ),
    GoRoute(
      path: VerifyOtpDuringChangePass.routeName,
      builder: (context, state) => VerifyOtpDuringChangePass(
        phoneNumber: state.extra as String? ?? '',
      ),
    ),
    GoRoute(
      path: InsertNewPassView.routeName,
      builder: (context, state) => const InsertNewPassView(),
    ),
    GoRoute(
      path: CongratesView.routeName,
      builder: (context, state) => const CongratesView(),
    ),
    GoRoute(
      path: VerifyAccountView.routeName,
      builder: (context, state) => const VerifyAccountView(),
    ),

    GoRoute(
      path: MainHomeView.routeName,
      builder: (context, state) => const MainHomeView(),
    ),

    GoRoute(
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: SpecialAdvertisementsView.routeName,
      builder: (context, state) => const SpecialAdvertisementsView(),
    ),
    GoRoute(
      path: AdvertiseDetailsView.routeName,
      builder: (context, state) => AdvertiseDetailsView(
        advertiseModel: state.extra as AdvertiseModel,
      ),
    ),

    GoRoute(
      path: FavouritesView.routeName,
      builder: (context, state) => const FavouritesView(),
    ),
    GoRoute(
      path: PublishAdvertiseView.routeName,
      builder: (context, state) => const PublishAdvertiseView(),
    ),

    GoRoute(
      path: ProfileView.routeName,
      builder: (context, state) => const ProfileView(),
    ),

    GoRoute(
      path: PersonalDetailsView.routeName,
      builder: (context, state) => const PersonalDetailsView(),
    ),

    GoRoute(
      path: PersonalProfileView.routeName,
      builder: (context, state) => const PersonalProfileView(),
    ),

    GoRoute(
      path: SearchView.routeName,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: SellerProfileView.routeName,
      builder: (context, state) => SellerProfileView(
        sellerId: state.extra as String,
      ),
    ),
  ],
);
