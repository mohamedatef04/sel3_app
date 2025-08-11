import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class AdvertiseInfoWidget extends StatelessWidget {
  const AdvertiseInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'اسم الاعلان',
              style: AppStyles.black24.copyWith(fontSize: 22.sp),
            ),
            const Spacer(),
            Row(
              spacing: 5.w,
              children: [
                const Icon(Icons.category),
                Text(
                  'الفئه',
                  style: AppStyles.black24.copyWith(
                    fontSize: 18.sp,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),

        Text(
          'المدينه',
          style: AppStyles.black24.copyWith(fontSize: 22.sp),
        ),

        Container(
          width: 200.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: const Color.fromARGB(255, 170, 141, 115),
          ),
          child: Center(
            child: Text(
              ' السعر الاجمالي',
              style: AppStyles.black24.copyWith(fontSize: 22.sp),
            ),
          ),
        ),
      ],
    );
  }
}
