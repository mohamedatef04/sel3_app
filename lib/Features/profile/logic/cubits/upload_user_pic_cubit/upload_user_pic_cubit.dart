import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/profile/logic/repos/upload_user_pic_repo.dart';

part 'upload_user_pic_state.dart';

class UploadUserPicCubit extends Cubit<UploadUserPicState> {
  UploadUserPicCubit(this.uploadUserPicRepo) : super(UploadUserPicInitial());

  final UploadUserPicRepo uploadUserPicRepo;

  Future<void> uploadUserPic({required File image}) async {
    emit(UploadUserPicLoadingState());
    try {
      final url = await uploadUserPicRepo.uploadUserPic(image: image);
      emit(UploadUserPicSuccessState(imageUrl: url));
    } on Exception catch (e) {
      emit(UploadUserPicFailureState(errorMessage: e.toString()));
    }
  }
}
