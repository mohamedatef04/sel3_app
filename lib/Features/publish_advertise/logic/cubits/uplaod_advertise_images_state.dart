part of 'uplaod_advertise_images_cubit.dart';

abstract class UplaodAdvertiseImagesState extends Equatable {
  const UplaodAdvertiseImagesState();

  @override
  List<Object> get props => [];
}

class UplaodAdvertiseImagesInitial extends UplaodAdvertiseImagesState {}

class UplaodAdvertiseImagesLoadingState extends UplaodAdvertiseImagesState {}

class UplaodAdvertiseImagesSuccessState extends UplaodAdvertiseImagesState {
  final List<String> imageUrls;

  const UplaodAdvertiseImagesSuccessState({required this.imageUrls});
}

class UplaodAdvertiseImagesFailureState extends UplaodAdvertiseImagesState {
  final String errorMessage;
  const UplaodAdvertiseImagesFailureState({required this.errorMessage});
}
