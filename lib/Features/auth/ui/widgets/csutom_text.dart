import 'package:flutter/material.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CsutomText extends StatelessWidget {
  const CsutomText({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.black24,
        ),
        Text(
          subtitle,
          style: AppStyles.white16.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
