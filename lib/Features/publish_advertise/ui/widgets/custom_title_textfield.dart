import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';

class CustomTitleTextfield extends StatelessWidget {
  const CustomTitleTextfield({
    super.key,
    this.validator,
    required this.controller,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      validator: validator,
      fillColor: const Color.fromARGB(90, 158, 158, 158),
      hintText: 'ادخل عنوان الاعلان هنا',
    );
  }
}
