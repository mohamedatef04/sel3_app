import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_header_text.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertisments_gridview.dart';
import 'package:sel3_app/Features/home/ui/widgets/categories_list.dart';
import 'package:sel3_app/Features/home/ui/widgets/custom_list_tile.dart';
import 'package:sel3_app/Features/home/ui/widgets/custom_offers_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/special_advertisments_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    children: const [
                      CustomListTile(),
                      CustomOffersWidget(),
                      CustomHeaderText(
                        title: 'الاعلانات المميزة',
                        subtitle: 'المزيد',
                      ),
                      SpecialAdvertismentsList(),
                      CustomHeaderText(
                        title: 'الفئات',
                        subtitle: 'المزيد',
                      ),
                      CategoriesList(),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                const AdvertismentsGridview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
