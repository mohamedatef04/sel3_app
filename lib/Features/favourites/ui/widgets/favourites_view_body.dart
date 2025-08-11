import 'package:flutter/material.dart';
import 'package:sel3_app/Features/favourites/ui/widgets/fav_list.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'المفضلة'),
      body: FavList(),
    );
  }
}
