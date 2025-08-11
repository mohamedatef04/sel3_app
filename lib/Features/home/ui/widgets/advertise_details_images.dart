import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/utils/assets.dart';

class AdvertiseDetailsImages extends StatelessWidget {
  const AdvertiseDetailsImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage(Assets.imagesItem),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Container(
                  width: 80.w,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                      image: AssetImage(Assets.imagesItem),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
