part of 'get_seller_rates_cubit.dart';

abstract class GetSellerRatesState extends Equatable {
  const GetSellerRatesState();

  @override
  List<Object> get props => [];
}

class GetSellerRatesInitial extends GetSellerRatesState {}

class GetSellerRatesLoadingState extends GetSellerRatesState {}

class GetSellerRatesSuccessState extends GetSellerRatesState {
  final List<SingleRate> myRatesList;
  const GetSellerRatesSuccessState({required this.myRatesList});
}

class GetSellerRatesFailureState extends GetSellerRatesState {
  final String errorMessage;
  const GetSellerRatesFailureState({required this.errorMessage});
}

class GetSellerRatesEmptyState extends GetSellerRatesState {}
