import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';

class CustomCityTextfield extends StatelessWidget {
  const CustomCityTextfield({
    super.key,
    required this.controller,
    this.validator,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      validator: validator,
      fillColor: const Color.fromARGB(90, 158, 158, 158),
      hintText: 'ادخل اسم المدينه هنا',
    );
  }
}
