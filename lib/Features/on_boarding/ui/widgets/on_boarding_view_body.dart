import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/ui/views/sign_in_view.dart';
import 'package:sel3_app/Features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:sel3_app/Features/on_boarding/ui/widgets/on_boarding_item.dart';
import 'package:sel3_app/core/services/shared_prefrences_service.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final List<OnBoardingItemModel> onBoardingItems;
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    onBoardingItems = [
      OnBoardingItemModel(
        title: 'تجربة فريده و سهلة',
        description: 'قم بشراء او بيع او استبدال اي منتج بسهولة',
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        buttonText: 'التالي',
      ),
      OnBoardingItemModel(
        title: 'تجربة فريده و سهلة',
        description:
            'اتصل بالمعلن او تواصل معه مباشرة عبر الدردشه داخل التطبيق بسهوله وامان',
        buttonText: 'التالي',
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
      OnBoardingItemModel(
        title: 'تجربة فريده و سهلة',
        description:
            'تصفح فئات التطبيق بكل سرعه وسلاسه وابحث عن ما تحتاجه بسهوله تامه',
        buttonText: 'انهاء',
        onPressed: () async {
          await SharedPrefrenceService.setBool('isFirst', true);
          GoRouter.of(context).pushReplacement(
            SignInView.routeName,
          ); // Navigate to OnboardingView
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: onBoardingItems.length,
              itemBuilder: (context, index) => OnBoardingItem(
                onBoardingItemModel: onBoardingItems[index],
              ),
            ),

            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.8,
              left: MediaQuery.sizeOf(context).width * 0.4,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
