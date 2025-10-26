part of 'get_seller_data_cubit.dart';

abstract class GetSellerDataState extends Equatable {
  const GetSellerDataState();

  @override
  List<Object> get props => [];
}

class GetSellerDataInitial extends GetSellerDataState {}

class GetSellerDataLoadingState extends GetSellerDataState {}

class GetSellerDataSuccessState extends GetSellerDataState {
  final UserModel userModel;
  const GetSellerDataSuccessState({required this.userModel});
}

class GetSellerDataErrorState extends GetSellerDataState {
  final String errorMessage;
  const GetSellerDataErrorState({required this.errorMessage});
}
