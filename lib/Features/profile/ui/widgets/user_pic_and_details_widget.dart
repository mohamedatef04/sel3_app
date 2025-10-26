import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserPicAndDetailsWidget extends StatelessWidget {
  const UserPicAndDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState) {
          return Column(
            spacing: 10.h,
            children: [
              CachedNetworkImage(
                imageUrl: state.userModel.image != null
                    ? state.userModel.image!
                    : 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
                imageBuilder: (context, imageProvider) => Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

              Text(state.userModel.name, style: AppStyles.black18),
              Text(state.userModel.email, style: AppStyles.black18),
            ],
          );
        } else if (state is GetUserDataFailureState) {
          return const Text('');
        } else {
          return Skeletonizer(
            enabled: true,
            child: Column(
              spacing: 10.h,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                Text('mohamed atef ali', style: AppStyles.black18),
                Text('smHsE@example.com', style: AppStyles.black18),
              ],
            ),
          );
        }
      },
    );
  }
}
