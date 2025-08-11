import 'package:flutter/material.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_details_view_body.dart';

class AdvertiseDetailsView extends StatelessWidget {
  const AdvertiseDetailsView({super.key});
  static const String routeName = '/AdvertiseDetailsView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AdvertiseDetailsViewBody(),
    );
  }
}
