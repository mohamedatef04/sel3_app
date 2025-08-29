import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/utils/assets.dart';

class ShowRateWidget extends StatefulWidget {
  const ShowRateWidget({super.key, required this.rate});

  final double rate;

  @override
  State<ShowRateWidget> createState() => _ShowRateWidgetState();
}

class _ShowRateWidgetState extends State<ShowRateWidget> {
  List<Widget> stars = [];
  @override
  void initState() {
    final rate = widget.rate;
    stars = List.generate(
      rate.round(),
      (_) => Image.asset(Assets.imagesYellowStar, width: 30.w, height: 30.h),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars.isEmpty
          ? [
              Image.asset(Assets.imagesStar, width: 30.w, height: 30.h),
              Image.asset(Assets.imagesStar, width: 30.w, height: 30.h),
              Image.asset(Assets.imagesStar, width: 30.w, height: 30.h),
              Image.asset(Assets.imagesStar, width: 30.w, height: 30.h),
              Image.asset(Assets.imagesStar, width: 30.w, height: 30.h),
            ]
          : stars,
    );
  }
}
