import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/ui/widgets/advice_item.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class AdvicesWidget extends StatelessWidget {
  const AdvicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color.fromARGB(255, 206, 202, 202),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5.w,
              children: [
                const Icon(Icons.dangerous),
                Text(
                  'تنبيهات',
                  style: AppStyles.black24.copyWith(
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
            const AdviceItem(text: 'التقي بالبائع في مكان عام و امن'),
            const AdviceItem(text: 'لا تحول اي مبلغ قبل رؤيه المنتج'),
            const AdviceItem(text: 'افحص المنتج جيدا قبل الشراء'),

            Text(
              'هدفنا راحتك وسلامتك في موقعنا',
              style: AppStyles.black24.copyWith(fontSize: 22.sp),
            ),
          ],
        ),
      ),
    );
  }
}
