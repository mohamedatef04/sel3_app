import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class SellerInfoWidget extends StatelessWidget {
  const SellerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: AppColors.primaryColor,
              size: 30.sp,
            ),

            Text(
              'معلومات البائع',
              style: AppStyles.black24.copyWith(
                color: AppColors.primaryColor,
                fontSize: 26.sp,
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: const Color.fromARGB(255, 190, 185, 185),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: AppColors.primaryColor,
                      image: const DecorationImage(
                        image: AssetImage(Assets.imagesLogo),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(
                    'اسم البائع',
                    style: AppStyles.black18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        'انتقل الي صفحة البائع',
                        style: AppStyles.black18,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.primaryColor,
                        size: 20.sp,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 70.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      spacing: 5.w,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          '4.5',
                          style: AppStyles.black18,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade300),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'رقم الهاتف',
                    style: AppStyles.black18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '0123456789',
                    style: AppStyles.black18,
                  ),
                  trailing: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          spacing: 10.w,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.45,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5.w,
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  Text(
                    'اتصل بالبائع',
                    style: AppStyles.black18.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.45,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5.w,
                children: [
                  const Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  Text(
                    'محادثه',
                    style: AppStyles.black18.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
