import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/views/advertise_details_view.dart';
import 'package:sel3_app/Features/home/ui/widgets/custom_fav_widget.dart';
import 'package:sel3_app/core/functions/convert_time.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class AdvertiseItem extends StatelessWidget {
  const AdvertiseItem({super.key, required this.advertiseModel});

  final AdvertiseModel advertiseModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AdvertiseDetailsView.routeName,
          extra: advertiseModel,
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: advertiseModel.image_1 ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: CustomFavWidget(
                      advertiseModel: advertiseModel,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 110.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        advertiseModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.black18.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '${advertiseModel.price} جنيه',
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
                            timeAgoArabic(advertiseModel.timeCreated),
                            style: AppStyles.black18,
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
      ),
    );
  }
}
