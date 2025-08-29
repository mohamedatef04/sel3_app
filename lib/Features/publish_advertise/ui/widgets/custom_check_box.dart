import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_colors.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isSpecial = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'اعلان مميز ؟',
          style: AppStyles.black18.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            activeColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            value: isSpecial,
            onChanged: (value) {
              if (value != null) {
                widget.onChanged(value);
                setState(() {
                  isSpecial = value;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
