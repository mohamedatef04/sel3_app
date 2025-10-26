import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sel3_app/Features/profile/logic/cubits/upload_user_pic_cubit/upload_user_pic_cubit.dart';
import 'package:sel3_app/core/theme/app_colors.dart';

class CutomImagePickerWidget extends StatefulWidget {
  const CutomImagePickerWidget({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  State<CutomImagePickerWidget> createState() => _CutomImagePickerWidgetState();
}

class _CutomImagePickerWidgetState extends State<CutomImagePickerWidget> {
  File? pickedImage;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
      context.read<UploadUserPicCubit>().uploadUserPic(
        image: pickedImage!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 3.w,
            ),

            image: DecorationImage(
              image: widget.imageUrl != null
                  ? NetworkImage(widget.imageUrl!)
                  : pickedImage != null
                  ? FileImage(pickedImage!)
                  : const NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/11/10/05/48/user-2935527_640.png',
                    ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: pickImage,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: Icon(
                  Icons.camera_alt,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
