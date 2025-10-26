import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_user_data_cubit.dart';
import 'package:sel3_app/Features/profile/logic/cubits/update_user_pic_cubit/update_user_pic_cubit.dart';
import 'package:sel3_app/Features/profile/logic/cubits/upload_user_pic_cubit/upload_user_pic_cubit.dart';
import 'package:sel3_app/Features/profile/ui/widgets/custom_listtile.dart';
import 'package:sel3_app/Features/profile/ui/widgets/cutom_image_picker_widget.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PersonalDetailsViewBody extends StatefulWidget {
  const PersonalDetailsViewBody({super.key});

  @override
  State<PersonalDetailsViewBody> createState() =>
      _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<PersonalDetailsViewBody> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadUserPicCubit, UploadUserPicState>(
      listener: (context, state) {
        if (state is UploadUserPicSuccessState) {
          final url = state.imageUrl;
          context.read<UpdateUserPicCubit>().updateUserPic(
            data: {'user_pic': url},
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'الملف الشخصي',
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) {
                  if (state is GetUserDataSuccessState) {
                    return Column(
                      spacing: 10.h,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CutomImagePickerWidget(
                          imageUrl: state.userModel.image,
                        ),
                        CustomListtile(
                          title: state.userModel.name,
                          icon: const Icon(Icons.person),
                        ),
                        CustomListtile(
                          title: state.userModel.email,
                          icon: const Icon(Icons.email),
                        ),
                        CustomListtile(
                          title: state.userModel.phone,
                          icon: const Icon(Icons.phone),
                        ),
                      ],
                    );
                  } else if (state is GetUserDataFailureState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return Skeletonizer(
                      enabled: true,
                      child: Column(
                        spacing: 10.h,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70.r,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 3.w,
                                ),
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                          const CustomListtile(
                            title: '',
                            icon: Icon(Icons.person),
                          ),
                          const CustomListtile(
                            title: '',
                            icon: Icon(Icons.email),
                          ),
                          const CustomListtile(
                            title: '',
                            icon: Icon(Icons.phone),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
