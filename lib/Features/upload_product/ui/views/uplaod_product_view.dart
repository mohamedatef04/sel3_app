import 'package:flutter/material.dart';
import 'package:sel3_app/Features/upload_product/ui/widgets/upload_product_view_body.dart';

class UplaodProductView extends StatelessWidget {
  const UplaodProductView({super.key});
  static const String routeName = '/upload_product';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UploadProductViewBody(),
    );
  }
}
