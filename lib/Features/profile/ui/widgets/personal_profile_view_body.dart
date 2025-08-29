import 'package:flutter/material.dart';
import 'package:sel3_app/Features/profile/ui/widgets/rate_widget.dart';
import 'package:sel3_app/Features/profile/ui/widgets/advertisements_widget.dart';
import 'package:sel3_app/Features/profile/ui/widgets/user_pic_and_name_and_rate_widget.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class PersonalProfileViewBody extends StatelessWidget {
  const PersonalProfileViewBody({super.key});

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
        body: const Column(
          children: [
            UserPicAndNameAndRateWidget(),
            TabBar(
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
                  AdvertisementsWidget(),
                  RateWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
