part of 'show_my_advertisements_cubit.dart';

abstract class ShowMyAdvertisementsState extends Equatable {
  const ShowMyAdvertisementsState();

  @override
  List<Object> get props => [];
}

class ShowMyAdvertisementsInitial extends ShowMyAdvertisementsState {}

class ShowMyAdvertisementsLoadingState extends ShowMyAdvertisementsState {}

class ShowMyAdvertisementsSuccessState extends ShowMyAdvertisementsState {
  final List<AdvertiseModel> myAdvertisementsList;

  const ShowMyAdvertisementsSuccessState({required this.myAdvertisementsList});
}

class ShowMyAdvertisementsFailureState extends ShowMyAdvertisementsState {
  final String errorMessage;

  const ShowMyAdvertisementsFailureState({required this.errorMessage});
}

class ShowMyAdvertisementsEmptyState extends ShowMyAdvertisementsState {}
