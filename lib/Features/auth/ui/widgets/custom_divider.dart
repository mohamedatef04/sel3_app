import 'package:flutter/material.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
        Text(
          'او سجل عن طريق جوجل',
          style: AppStyles.black18.copyWith(color: Colors.grey),
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
