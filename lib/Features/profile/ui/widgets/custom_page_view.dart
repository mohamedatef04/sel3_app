import 'package:flutter/material.dart';
import 'package:sel3_app/Features/profile/ui/widgets/rate_widget.dart';
import 'package:sel3_app/Features/profile/ui/widgets/advertisements_widget.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,

      child: PageView(
        children: const [
          AdvertisementsWidget(),
          RateWidget(),
        ],
      ),
    );
  }
}
