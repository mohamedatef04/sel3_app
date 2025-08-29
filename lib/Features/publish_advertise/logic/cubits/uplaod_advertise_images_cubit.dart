import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/publish_advertise/logic/repos/upload_advertise_images_repo.dart';

part 'uplaod_advertise_images_state.dart';

class UplaodAdvertiseImagesCubit extends Cubit<UplaodAdvertiseImagesState> {
  UplaodAdvertiseImagesCubit(this.uploadAdvertiseImagesRepo)
    : super(UplaodAdvertiseImagesInitial());

  final UploadAdvertiseImagesRepo uploadAdvertiseImagesRepo;

  Future<void> uploadAdvertiseImges({required List<File> images}) async {
    emit(UplaodAdvertiseImagesLoadingState());
    try {
      final imageUrls = await uploadAdvertiseImagesRepo.uploadAdvertiseImges(
        images: images,
      );
      emit(UplaodAdvertiseImagesSuccessState(imageUrls: imageUrls));
    } catch (e) {
      emit(UplaodAdvertiseImagesFailureState(errorMessage: e.toString()));
    }
  }
}
