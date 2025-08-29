part of 'get_category_advertisements_cubit.dart';

abstract class GetCategoryAdvertisementsState extends Equatable {
  const GetCategoryAdvertisementsState();

  @override
  List<Object> get props => [];
}

class GetCategoryAdvertisementsInitial extends GetCategoryAdvertisementsState {}

class GetCategoryAdvertisementsLoadingState
    extends GetCategoryAdvertisementsState {}

class GetCategoryAdvertisementsSuccessState
    extends GetCategoryAdvertisementsState {
  final List<AdvertiseModel> categoryAdvertisements;
  const GetCategoryAdvertisementsSuccessState({
    required this.categoryAdvertisements,
  });
}

class GetCategoryAdvertisementsFailureState
    extends GetCategoryAdvertisementsState {
  final String errorMessage;
  const GetCategoryAdvertisementsFailureState({
    required this.errorMessage,
  });
}
