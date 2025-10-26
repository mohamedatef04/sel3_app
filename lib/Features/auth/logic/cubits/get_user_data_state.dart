part of 'get_user_data_cubit.dart';

abstract class GetUserDataState extends Equatable {
  const GetUserDataState();

  @override
  List<Object> get props => [];
}

class GetUserDataInitial extends GetUserDataState {}

class GetUserDataLoadingState extends GetUserDataState {}

class GetUserDataSuccessState extends GetUserDataState {
  final UserModel userModel;
  const GetUserDataSuccessState({required this.userModel});
}

class GetUserDataFailureState extends GetUserDataState {
  final String errorMessage;
  const GetUserDataFailureState({required this.errorMessage});
}
