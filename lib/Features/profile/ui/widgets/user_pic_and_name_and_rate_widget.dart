import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/profile/ui/widgets/show_rate_widget.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class UserPicAndNameAndRateWidget extends StatefulWidget {
  const UserPicAndNameAndRateWidget({super.key});

  @override
  State<UserPicAndNameAndRateWidget> createState() =>
      _UserPicAndDetailsWidgetState();
}

class _UserPicAndDetailsWidgetState extends State<UserPicAndNameAndRateWidget> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState) {
          DateTime parsed = DateTime.parse(state.userModel.timeCreated);
          String onlyDate = parsed.toIso8601String().split("T").first;

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

              Text(
                state.userModel.name,
                style: AppStyles.black18.copyWith(fontWeight: FontWeight.bold),
              ),

              Text(
                'عضو منذ: $onlyDate',
                style: AppStyles.black18.copyWith(fontSize: 20.sp),
              ),
              Text(
                'رقم الهاتف: ${state.userModel.phone}',
                style: AppStyles.black18.copyWith(fontSize: 20.sp),
              ),
              ShowRateWidget(
                rate: state.userModel.rates!.isNotEmpty
                    ? double.parse(state.userModel.rates![0]['rate_value'])
                    : 0.0,
              ),
            ],
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
