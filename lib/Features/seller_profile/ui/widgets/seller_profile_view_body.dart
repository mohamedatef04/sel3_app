import 'package:flutter/material.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/rate_widget_for_seller_profile.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/seller_advertisements_widget.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/seller_pic_and_rate_widget.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class SellerProfileViewBody extends StatelessWidget {
  const SellerProfileViewBody({super.key, required this.sellerId});
  final String sellerId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'الملف الشخصي',
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            SellerPicAndRateWidget(
              sellerId: sellerId,
            ),
            const TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "الإعلانات"),
                Tab(text: "التقييمات"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SellerAdvertisementsWidget(
                    sellerId: sellerId,
                  ),
                  RateWidgetForSellerProfile(
                    sellerId: sellerId,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
