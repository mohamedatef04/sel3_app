import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_details_images.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_info_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_more_details_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/advices_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/seller_info_widget.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class AdvertiseDetailsViewBody extends StatelessWidget {
  const AdvertiseDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'تفاصيل الاعلان'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AdvertiseDetailsImages(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            const SliverToBoxAdapter(
              child: AdvertiseInfoWidget(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            const SliverToBoxAdapter(
              child: AdvertiseMoreDetailsWidget(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            const SliverToBoxAdapter(
              child: SellerInfoWidget(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            const SliverToBoxAdapter(
              child: AdvicesWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
