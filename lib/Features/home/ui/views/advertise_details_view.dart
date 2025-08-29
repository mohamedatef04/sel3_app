import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/auth/logic/cubits/get_seller_data_cubit.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/home/ui/widgets/advertise_details_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class AdvertiseDetailsView extends StatelessWidget {
  const AdvertiseDetailsView({super.key, required this.advertiseModel});
  static const String routeName = '/AdvertiseDetailsView';
  final AdvertiseModel advertiseModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetSellerDataCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        body: AdvertiseDetailsViewBody(
          advertiseModel: advertiseModel,
        ),
      ),
    );
  }
}
