import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_button.dart';
import 'package:sel3_app/Features/home/logic/cubits/nav%20bar/nav_bar_cubit.dart';
import 'package:sel3_app/Features/publish_advertise/logic/cubits/publish_advertise/publish_advertise_cubit.dart';
import 'package:sel3_app/Features/publish_advertise/logic/cubits/uplaod_advertise_images_cubit.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/advertise_image_picker.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_categories_menu.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_check_box.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_city_textfield.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_description_textfield.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_location_textfield.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_price_textfield.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_title.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/custom_title_textfield.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PublishAdvertiseViewBody extends StatefulWidget {
  const PublishAdvertiseViewBody({super.key});

  @override
  State<PublishAdvertiseViewBody> createState() =>
      _PublishAdvertiseViewBodyState();
}

class _PublishAdvertiseViewBodyState extends State<PublishAdvertiseViewBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String? selectedCategory;
  bool? isSpecial = false;
  List<File>? images;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    phoneController.dispose();
    locationController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'انشئ اعلان جديد'),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
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
                CustomTitleTextfield(
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل عنوان الاعلان';
                    } else {
                      return null;
                    }
                  },
                ),
                const Row(
                  children: [
                    CustomTitle(title: '*الوصف'),
                  ],
                ),
                CustomDescriptionTextfield(
                  controller: descriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل الوصف';
                    } else {
                      return null;
                    }
                  },
                ),
                const Row(
                  children: [
                    CustomTitle(title: '* السعر'),
                  ],
                ),
                CustomPriceTextfield(
                  controller: priceController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل السعر';
                    } else {
                      return null;
                    }
                  },
                ),
                const Row(
                  children: [
                    CustomTitle(title: '* الفئة'),
                  ],
                ),
                CustomCategoriesMenu(
                  onSelected: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),

                const Row(
                  children: [
                    CustomTitle(title: '* الموقع'),
                  ],
                ),
                CustomLocationTextfield(
                  controller: locationController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل الموقع';
                    } else {
                      return null;
                    }
                  },
                ),
                const Row(
                  children: [
                    CustomTitle(title: '* المدينة'),
                  ],
                ),

                CustomCityTextfield(
                  controller: cityController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل القريه';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomCheckBox(
                  onChanged: (value) {
                    setState(() {
                      isSpecial = value;
                    });
                  },
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
                AdvertiseImagePicker(
                  onImagesSelected: (value) {
                    setState(() {
                      images = value;
                    });
                  },
                ),

                BlocListener<
                  UplaodAdvertiseImagesCubit,
                  UplaodAdvertiseImagesState
                >(
                  listener: (context, imagesState) {
                    if (imagesState is UplaodAdvertiseImagesSuccessState) {
                      context.read<PublishAdvertiseCubit>().publishAdvertise(
                        data: {
                          'user_id':
                              Supabase.instance.client.auth.currentUser!.id,
                          'title': titleController.text.trim(),
                          'description': descriptionController.text.trim(),
                          'price': priceController.text.trim(),
                          'category': selectedCategory!,
                          'location': locationController.text.trim(),
                          'city': cityController.text.trim(),
                          'is_special': isSpecial!,
                          'pic_1': imagesState.imageUrls.isNotEmpty
                              ? imagesState.imageUrls[0]
                              : null,
                          'pic_2': imagesState.imageUrls.length > 1
                              ? imagesState.imageUrls[1]
                              : null,
                          'pic_3': imagesState.imageUrls.length > 2
                              ? imagesState.imageUrls[2]
                              : null,
                          'pic_4': imagesState.imageUrls.length > 3
                              ? imagesState.imageUrls[3]
                              : null,
                          'pic_5': imagesState.imageUrls.length > 4
                              ? imagesState.imageUrls[4]
                              : null,
                        },
                      );
                    } else if (imagesState
                        is UplaodAdvertiseImagesFailureState) {
                      showSnakBar(context, message: imagesState.errorMessage);
                    }
                  },
                  child:
                      BlocListener<
                        PublishAdvertiseCubit,
                        PublishAdvertiseState
                      >(
                        listener: (context, publishState) {
                          if (publishState is PublishAdvertiseSuccessState) {
                            showSnakBar(
                              context,
                              message: 'تم نشر الاعلان بنجاح',
                            );
                            context.read<NavBarCubit>().changeIndex(
                              0,
                            );
                          } else if (publishState
                              is PublishAdvertiseFailureState) {
                            showSnakBar(
                              context,
                              message: publishState.errorMessage,
                            );
                          }
                        },
                        child:
                            BlocBuilder<
                              UplaodAdvertiseImagesCubit,
                              UplaodAdvertiseImagesState
                            >(
                              builder: (context, imagesState) {
                                return BlocBuilder<
                                  PublishAdvertiseCubit,
                                  PublishAdvertiseState
                                >(
                                  builder: (context, publishState) {
                                    final isLoading =
                                        imagesState
                                            is UplaodAdvertiseImagesLoadingState ||
                                        publishState
                                            is PublishAdvertiseLoadingState;

                                    return CustomButton(
                                      child: isLoading
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              'نشر الاعلان',
                                              style: AppStyles.white16,
                                            ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate() &&
                                            selectedCategory != null &&
                                            isSpecial != null) {
                                          formKey.currentState!.save();
                                          context
                                              .read<
                                                UplaodAdvertiseImagesCubit
                                              >()
                                              .uploadAdvertiseImges(
                                                images: images ?? [],
                                              );
                                        } else {
                                          setState(() {
                                            autovalidateMode =
                                                AutovalidateMode.always;
                                          });
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
