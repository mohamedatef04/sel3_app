import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/search/ui/views/search_view.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/utils/assets.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            spacing: 10.w,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(Assets.imagesLogo),
              ),

              Column(
                children: [
                  Text(
                    ' اهلا بك !',
                    style: AppStyles.black24.copyWith(fontSize: 22.sp),
                  ),
                  BlocBuilder<GetUserDataCubit, GetUserDataState>(
                    builder: (context, state) {
                      if (state is GetUserDataSuccessState) {
                        return Text(
                          state.userModel.name,
                          style: AppStyles.black18.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        );
                      } else {
                        return Text(
                          '',
                          style: AppStyles.black18.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: 10.w,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(SearchView.routeName);
                },
                child: Image.asset(
                  Assets.imagesSearch,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
              Image.asset(
                Assets.imagesNotificationBell,
                width: 30.w,
                height: 30.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
