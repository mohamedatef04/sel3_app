import 'dart:ui';

class OnBoardingItemModel {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onPressed;

  OnBoardingItemModel({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });
}
