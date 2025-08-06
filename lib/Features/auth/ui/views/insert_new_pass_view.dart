import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/insert_new_pass_view_body.dart';

class InsertNewPassView extends StatelessWidget {
  const InsertNewPassView({super.key});
  static const routeName = '/insertNewPassView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InsertNewPassViewBody(),
    );
  }
}
