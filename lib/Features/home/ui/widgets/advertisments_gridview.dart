import 'package:flutter/material.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_item.dart';

class AdvertismentsGridview extends StatelessWidget {
  const AdvertismentsGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => const AdvertiseItem(),
    );
  }
}
