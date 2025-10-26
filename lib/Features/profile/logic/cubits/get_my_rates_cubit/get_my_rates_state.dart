part of 'get_my_rates_cubit.dart';

abstract class GetMyRatesState extends Equatable {
  const GetMyRatesState();

  @override
  List<Object> get props => [];
}

class GetMyRatesInitial extends GetMyRatesState {}

class GetMyRatesLoadingState extends GetMyRatesState {}

class GetMyRatesSuccessState extends GetMyRatesState {
  final List<RateModel> myRatesList;
  const GetMyRatesSuccessState({required this.myRatesList});
}

class GetMyRatesFailureState extends GetMyRatesState {
  final String errorMessage;
  const GetMyRatesFailureState({required this.errorMessage});
}

class GetMyRatesEmptyState extends GetMyRatesState {}
