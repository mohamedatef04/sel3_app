import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/Features/upload_product/ui/widgets/custom_title.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class UploadProductViewBody extends StatelessWidget {
  const UploadProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'انشئ اعلان جديد'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5.h,
            children: [
              const Row(
                children: [
                  CustomTitle(title: '*عنوان الاعلان'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل عنوان الاعلان هنا',
              ),
              const Row(
                children: [
                  CustomTitle(title: '*الوصف'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل الوصف هنا',
              ),
              const Row(
                children: [
                  CustomTitle(title: '* السعر'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل السعر هنا بالجنيه',
              ),
              const Row(
                children: [
                  CustomTitle(title: '* الفئة'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل الفئة هنا',
              ),
              const Row(
                children: [
                  CustomTitle(title: '* رقم الهاتف'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل رقم الهاتف هنا',
              ),
              const Row(
                children: [
                  CustomTitle(title: '* الموقع'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل اسم المدينه هنا',
              ),
              const Row(
                children: [
                  CustomTitle(title: '* القريه'),
                ],
              ),
              const CustomTextFormField(
                fillColor: Color.fromARGB(90, 158, 158, 158),
                hintText: 'ادخل اسم القريه هنا',
              ),
              const Row(
                children: [
                  CustomTitle(title: '* اضافه صور للاعلان'),
                ],
              ),
              Text(
                'يمكنك رفع حتي 5 صور للاعلان الاولي ستكون الصوره الرئيسية',
                style: AppStyles.white16.copyWith(color: Colors.grey),
              ),
              CustomButton(
                child: Text('اضافه الصور', style: AppStyles.white16),
                onPressed: () {},
              ),
              CustomButton(
                child: Text(' نشر الاعلان', style: AppStyles.white16),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
