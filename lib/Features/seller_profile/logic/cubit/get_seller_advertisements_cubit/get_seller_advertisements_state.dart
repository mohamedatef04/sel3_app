part of 'get_seller_advertisements_cubit.dart';

abstract class GetSellerAdvertisementsState extends Equatable {
  const GetSellerAdvertisementsState();

  @override
  List<Object> get props => [];
}

class GetSellerAdvertisementsInitial extends GetSellerAdvertisementsState {}

class GetSellerAdvertisementsLoadingState
    extends GetSellerAdvertisementsState {}

class GetSellerAdvertisementsSuccessState extends GetSellerAdvertisementsState {
  final List<AdvertiseModel> advertisementsList;

  const GetSellerAdvertisementsSuccessState({required this.advertisementsList});
}

class GetSellerAdvertisementsFailureState extends GetSellerAdvertisementsState {
  final String errorMessage;
  const GetSellerAdvertisementsFailureState({required this.errorMessage});
}

class GetSellerAdvertisementsEmptyState extends GetSellerAdvertisementsState {}
