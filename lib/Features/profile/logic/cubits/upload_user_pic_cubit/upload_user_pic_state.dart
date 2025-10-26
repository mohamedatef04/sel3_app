part of 'upload_user_pic_cubit.dart';

abstract class UploadUserPicState extends Equatable {
  const UploadUserPicState();

  @override
  List<Object> get props => [];
}

class UploadUserPicInitial extends UploadUserPicState {}

class UploadUserPicLoadingState extends UploadUserPicState {}

class UploadUserPicSuccessState extends UploadUserPicState {
  final String imageUrl;
  const UploadUserPicSuccessState({required this.imageUrl});
}

class UploadUserPicFailureState extends UploadUserPicState {
  final String errorMessage;
  const UploadUserPicFailureState({required this.errorMessage});
}
