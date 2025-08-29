part of 'get_favourite_items_cubit.dart';

abstract class GetFavouriteItemsState extends Equatable {
  const GetFavouriteItemsState();

  @override
  List<Object> get props => [];
}

class GetFavouriteItemsInitial extends GetFavouriteItemsState {}

class GetFavouriteItemsLoadingState extends GetFavouriteItemsState {}

class GetFavouriteItemsEmptyState extends GetFavouriteItemsState {}

class GetFavouriteItemsSuccessState extends GetFavouriteItemsState {
  final List<AdvertiseModel> myFavouriteItems;
  const GetFavouriteItemsSuccessState({required this.myFavouriteItems});
}

class GetFavouriteItemsFailureState extends GetFavouriteItemsState {
  final String errorMessage;
  const GetFavouriteItemsFailureState({required this.errorMessage});
}

class RemoveFavouriteItemSuccessState extends GetFavouriteItemsState {}

class GetFavouriteItemsAfterRemove extends GetFavouriteItemsState {
  final List<AdvertiseModel> myFavouriteItems;
  const GetFavouriteItemsAfterRemove({required this.myFavouriteItems});
}

class RemoveFavouriteItemFailureState extends GetFavouriteItemsState {
  final String errorMessage;
  const RemoveFavouriteItemFailureState({required this.errorMessage});
}
