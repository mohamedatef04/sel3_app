import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/utils/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomOffersWidget extends StatefulWidget {
  const CustomOffersWidget({super.key});

  @override
  State<CustomOffersWidget> createState() => _CustomOffersWidgetState();
}

class _CustomOffersWidgetState extends State<CustomOffersWidget> {
  final List<String> images = [
    Assets.imagesBanner1,
    Assets.imagesBanner1,
    Assets.imagesBanner1,
  ];
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: Colors.grey,
            activeDotColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
