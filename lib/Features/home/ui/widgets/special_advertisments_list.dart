import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';

class SpecialAdvertismentsList extends StatelessWidget {
  const SpecialAdvertismentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: const AdvertiseItem(),
          );
        },
      ),
    );
  }
}
