part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class AllSearchItemsSuccessState extends SearchState {
  final List<AdvertiseModel> advertismentsList;
  const AllSearchItemsSuccessState({
    required this.advertismentsList,
  });
}

class SearchItemsSuccessState extends SearchState {
  final List<AdvertiseModel> advertismentsList;
  const SearchItemsSuccessState({
    required this.advertismentsList,
  });
}

class SearchFailureState extends SearchState {
  final String errorMessage;
  const SearchFailureState({
    required this.errorMessage,
  });
}

class SearchEmptyState extends SearchState {}
