part of 'get_all_advertisements_cubit.dart';

abstract class GetAllAdvertisementsState extends Equatable {
  const GetAllAdvertisementsState();

  @override
  List<Object> get props => [];
}

class GetAllAdvertisementsInitial extends GetAllAdvertisementsState {}

class GetAllAdvertisementsLoadingState extends GetAllAdvertisementsState {}

class GetAllAdvertisementsEmptyState extends GetAllAdvertisementsState {}

class GetAllAdvertisementsSuccessState extends GetAllAdvertisementsState {
  final List<AdvertiseModel> allAdvertisementsList;
  const GetAllAdvertisementsSuccessState({required this.allAdvertisementsList});
}

class GetAllAdvertisementsFailureState extends GetAllAdvertisementsState {
  final String errorMessage;
  const GetAllAdvertisementsFailureState({required this.errorMessage});
}
