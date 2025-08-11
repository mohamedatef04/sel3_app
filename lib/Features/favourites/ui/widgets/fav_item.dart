import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    image: const DecorationImage(
                      image: AssetImage(Assets.imagesItem),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 10.w,
                  top: 10.h,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.imagesHeart,
                        color: AppColors.primaryColor,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم المنتج',
                      style: AppStyles.black18.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '500 جنيه',
                      style: AppStyles.black18.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 22.sp,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          'منذ 3 ايام',
                          style: AppStyles.black18,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          'الكترونيات',
                          style: AppStyles.black18,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              'القاهرة',
                              style: AppStyles.black18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
