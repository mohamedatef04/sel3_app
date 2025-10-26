part of 'get_special_advertisements_cubit.dart';

abstract class GetSpecialAdvertisementsState extends Equatable {
  const GetSpecialAdvertisementsState();

  @override
  List<Object> get props => [];
}

class GetSpecialAdvertisementsInitial extends GetSpecialAdvertisementsState {}

class GetSpecialAdvertisementsLoadingState
    extends GetSpecialAdvertisementsState {}

class GetSpecialAdvertisementsSuccessState
    extends GetSpecialAdvertisementsState {
  final List<AdvertiseModel> specialAdvertisements;
  const GetSpecialAdvertisementsSuccessState({
    required this.specialAdvertisements,
  });
  @override
  List<Object> get props => [
    const DeepCollectionEquality().hash(specialAdvertisements),
  ];
}

class GetSpecialAdvertisementsFailureState
    extends GetSpecialAdvertisementsState {
  final String errorMessage;
  const GetSpecialAdvertisementsFailureState({
    required this.errorMessage,
  });
}
