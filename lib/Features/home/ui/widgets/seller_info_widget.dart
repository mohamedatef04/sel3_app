import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_seller_data_cubit.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/widgets/seller_info_placeholder.dart';
import 'package:sel3_app/Features/seller_profile/ui/views/seller_profile.dart';
import 'package:sel3_app/core/functions/call_seller.dart';
import 'package:sel3_app/core/functions/copy_phone_number.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SellerInfoWidget extends StatefulWidget {
  const SellerInfoWidget({super.key, required this.advertiseModel});
  final AdvertiseModel advertiseModel;

  @override
  State<SellerInfoWidget> createState() => _SellerInfoWidgetState();
}

class _SellerInfoWidgetState extends State<SellerInfoWidget> {
  @override
  void initState() {
    context.read<GetSellerDataCubit>().getSellerData(
      userId: widget.advertiseModel.userId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSellerDataCubit, GetSellerDataState>(
      builder: (context, state) {
        if (state is GetSellerDataSuccessState) {
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            25.r,
                          ),
                          child: CachedNetworkImage(
                            width: 50.w,
                            height: 50.w,
                            fit: BoxFit.cover,
                            imageUrl: state.userModel.image != null
                                ? state.userModel.image!
                                : 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),

                        title: Text(
                          state.userModel.name,
                          style: AppStyles.black18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: GestureDetector(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push(
                              SellerProfileView.routeName,
                              extra: state.userModel.id,
                            );
                          },
                          child: Row(
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
                        ),
                        trailing: Container(
                          width: 50.w,
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
                                state.userModel.rates!.isNotEmpty
                                    ? state.userModel.rates!.first['rate_value']
                                          .toString()
                                    : '0.0',
                                style: AppStyles.black18.copyWith(
                                  color: Colors.white,
                                ),
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
                          state.userModel.phone,
                          style: AppStyles.black18,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            copyPhoneNumber(phone: state.userModel.phone);
                          },
                          child: Container(
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
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                spacing: 10.w,
                children: [
                  GestureDetector(
                    onTap: () {
                      callSeller(phone: state.userModel.phone);
                    },
                    child: Container(
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
                  ),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
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
                  ),
                ],
              ),
            ],
          );
        } else if (state is GetSellerDataErrorState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Skeletonizer(
            enabled: true,
            child: SellerInfoPlaceholder(),
          );
        }
      },
    );
  }
}
