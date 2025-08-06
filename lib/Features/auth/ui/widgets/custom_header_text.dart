import 'package:flutter/material.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.black24,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppStyles.white16.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
