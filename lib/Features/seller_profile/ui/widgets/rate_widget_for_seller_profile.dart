import 'package:flutter/material.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/post_rate_widget.dart';
import 'package:sel3_app/Features/seller_profile/ui/widgets/seller_rates_list.dart';

class RateWidgetForSellerProfile extends StatelessWidget {
  const RateWidgetForSellerProfile({super.key, required this.sellerId});
  final String sellerId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SellerRatesList(
          sellerId: sellerId,
        ),

        Positioned(
          bottom: 20,
          right: 20,
          child: PostRateWidget(
            sellerId: sellerId,
          ),
        ),
      ],
    );
  }
}
