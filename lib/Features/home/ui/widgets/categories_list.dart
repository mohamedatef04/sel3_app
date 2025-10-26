import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/logic/cubits/get%20all%20advertisments/get_all_advertisements_cubit.dart';
import 'package:sel3_app/Features/home/ui/widgets/category_index.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndx = 0;
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.category, 'title': 'الكل'},
    {'icon': Icons.cruelty_free, 'title': 'الحيوانات'},
    {'icon': Icons.home_work, 'title': 'العقارات'},
    {'icon': Icons.category, 'title': 'الموضه و الجمال'},
    {'icon': Icons.car_crash, 'title': 'سيارات'},
    {'icon': Icons.category, 'title': 'الاكسسوارات'},
    {'icon': Icons.category, 'title': 'ادوات مهنيه'},
    {'icon': Icons.laptop_mac, 'title': 'الكترونيات'},
    {'icon': Icons.category, 'title': 'الاجهزه المنزليه'},
    {'icon': Icons.category, 'title': 'الاثاث المنزلي'},
    {
      'icon': Icons.category,
      'title': 'ملابس',
    },
    {
      'icon': Icons.category,
      'title': 'اخري',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: CategoryIndex(
              icon: categories[index]['icon'],
              title: categories[index]['title'],
              isSelected: selectedIndx == index,
              onTap: () {
                setState(() {
                  selectedIndx = index;
                  if (categories[index]['title'] == 'الكل') {
                    context
                        .read<GetAllAdvertisementsCubit>()
                        .getAllAdvertisements(
                          category: 'select=*',
                        );
                  } else {
                    context
                        .read<GetAllAdvertisementsCubit>()
                        .getAllAdvertisements(
                          category: 'category=eq.${categories[index]['title']}',
                        );
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
