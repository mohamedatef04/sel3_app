import 'package:flutter/material.dart';
import 'package:sel3_app/Features/auth/ui/widgets/congrates_view_body.dart';

class CongratesView extends StatelessWidget {
  const CongratesView({super.key});
  static const String routeName = '/congrates';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CongratesViewBody(),
    );
  }
}
