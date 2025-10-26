import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,

    required this.onBoardingItemModel,
  });

  final OnBoardingItemModel onBoardingItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesIcon,
          width: 200.w,
        ),
        Text(
          onBoardingItemModel.title,
          textAlign: TextAlign.center,
          style: AppStyles.black24,
        ),
        Text(
          onBoardingItemModel.description,
          textAlign: TextAlign.center,
          style: AppStyles.black18,
        ),
        SizedBox(height: 20.h),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: Size(200.w, 50.h),
          ),
          onPressed: onBoardingItemModel.onPressed,
          child: Text(
            onBoardingItemModel.buttonText,
            style: AppStyles.white16,
          ),
        ),
      ],
    );
  }
}
