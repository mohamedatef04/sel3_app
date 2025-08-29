import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/profile/data/models/rate_model.dart';
import 'package:sel3_app/Features/seller_profile/logic/cubit/post_a_new_rate_cubit/post_a_new_rate_cubit.dart';
import 'package:sel3_app/core/functions/show_snak_bar.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostRateWidget extends StatefulWidget {
  const PostRateWidget({super.key, required this.sellerId});
  final String sellerId;

  @override
  State<PostRateWidget> createState() => _PostRateWidgetState();
}

class _PostRateWidgetState extends State<PostRateWidget> {
  TextEditingController rateController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    rateController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          builder: (bottomSheetContext) {
            return BlocProvider.value(
              value: BlocProvider.of<PostANewRateCubit>(context),
              child: _buildBottomSheetContent(bottomSheetContext),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }

  /// ⬇⬇ UI الخاص بالـ BottomSheet في Function منفصلة ⬇⬇
  Widget _buildBottomSheetContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "إضافة تقييم",
              style: AppStyles.black18.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),

            // إدخال التقييم
            TextFormField(
              controller: rateController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى ادخال التقييم';
                } else if (int.parse(value) < 1 || int.parse(value) > 5) {
                  return 'يرجى ادخال التقييم بين 1 و 5';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "التقييم (من 1 لـ 5)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // إدخال التعليق
            TextFormField(
              controller: commentController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى ادخال التعليق';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "أضف تعليقك",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.h),

            // زر الإضافة مع BlocConsumer
            BlocConsumer<PostANewRateCubit, PostANewRateState>(
              listener: (context, state) {
                if (state is PostANewRateSuccessState) {
                  Navigator.pop(context);
                  showSnakBar(context, message: 'تم اضافة التقييم بنجاح');
                } else if (state is PostANewRateFailureState) {
                  showSnakBar(context, message: state.errorMessage);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      context.read<PostANewRateCubit>().postANewRate(
                        rate: SingleRate(
                          from: Supabase.instance.client.auth.currentUser!.id,
                          to: widget.sellerId,
                          rateValue: rateController.text.trim(),
                          comment: commentController.text.trim(),
                        ),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: state is PostANewRateLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text("إضافة", style: AppStyles.white16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
