import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/publish_advertise/data/repos/publish_advertise_repo_impl.dart';
import 'package:sel3_app/Features/publish_advertise/data/repos/upload_advertise_images_repo_impl.dart';
import 'package:sel3_app/Features/publish_advertise/logic/cubits/publish_advertise/publish_advertise_cubit.dart';
import 'package:sel3_app/Features/publish_advertise/logic/cubits/uplaod_advertise_images_cubit.dart';
import 'package:sel3_app/Features/publish_advertise/ui/widgets/publish_advertise_view_body.dart';
import 'package:sel3_app/core/services/get_it_service.dart';

class PublishAdvertiseView extends StatelessWidget {
  const PublishAdvertiseView({super.key});
  static const String routeName = '/upload_product';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PublishAdvertiseCubit(
            getIt<PublishAdvertiseRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => UplaodAdvertiseImagesCubit(
            getIt.get<UploadAdvertiseImagesRepoImpl>(),
          ),
        ),
      ],
      child: const Scaffold(
        body: PublishAdvertiseViewBody(),
      ),
    );
  }
}
