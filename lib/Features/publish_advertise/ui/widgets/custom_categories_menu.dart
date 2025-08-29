import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/theme/app_styles.dart';

class CustomCategoriesMenu extends StatelessWidget {
  const CustomCategoriesMenu({super.key, required this.onSelected});
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(
          Colors.white,
        ), // Ensure background
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        elevation: WidgetStateProperty.all(
          4,
        ), // Optional: shadow to show radius
      ),
      width: MediaQuery.sizeOf(context).width,
      textStyle: AppStyles.black18,
      hintText: 'اختر القسم',
      onSelected: (value) => onSelected(value!),
      dropdownMenuEntries: const [
        DropdownMenuEntry(label: 'الحيوانات', value: 'الحيوانات'),
        DropdownMenuEntry(label: 'العقارات', value: 'العقارات'),
        DropdownMenuEntry(label: 'الموضه و الجمال', value: 'الموضه و الجمال'),
        DropdownMenuEntry(label: 'سيارات', value: 'سيارات'),
        DropdownMenuEntry(label: 'الاكسسوارات', value: 'الاكسسوارات'),
        DropdownMenuEntry(label: 'ادوات مهنيه', value: 'ادوات مهنيه'),
        DropdownMenuEntry(label: 'الكترونيات', value: 'الكترونيات'),
        DropdownMenuEntry(label: 'الاجهزه المنزليه', value: 'الاجهزه المنزليه'),
        DropdownMenuEntry(label: 'الاثاث المنزلي', value: 'الاثاث المنزلي'),
        DropdownMenuEntry(label: 'ملابس', value: 'ملابس'),
        DropdownMenuEntry(label: 'اخري', value: 'اخري'),
      ],
    );
  }
}
