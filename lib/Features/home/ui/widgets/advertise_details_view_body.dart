import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_details_images.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_info_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_more_details_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/advices_widget.dart';
import 'package:sel3_app/Features/home/ui/widgets/seller_info_widget.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class AdvertiseDetailsViewBody extends StatelessWidget {
  const AdvertiseDetailsViewBody({super.key, required this.advertiseModel});
  final AdvertiseModel advertiseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تفاصيل الاعلان',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AdvertiseDetailsImages(
                advertiseModel: advertiseModel,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: AdvertiseInfoWidget(
                advertiseModel: advertiseModel,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: AdvertiseMoreDetailsWidget(
                advertiseModel: advertiseModel,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: SellerInfoWidget(
                advertiseModel: advertiseModel,
              ),
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
