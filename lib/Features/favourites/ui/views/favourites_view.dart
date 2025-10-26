import 'package:flutter/material.dart';
import 'package:sel3_app/Features/favourites/ui/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});
  static const String routeName = '/favouritesView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavouritesViewBody(),
    );
  }
}
