import 'package:flutter/material.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

void showSnakBar(
  BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(message, style: AppStyles.white16),
      backgroundColor: AppColors.primaryColorLight,
    ),
  );
}
