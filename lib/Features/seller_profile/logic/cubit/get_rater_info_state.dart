part of 'get_rater_info_cubit.dart';

abstract class GetRaterInfoState extends Equatable {
  const GetRaterInfoState();

  @override
  List<Object> get props => [];
}

class GetRaterInfoInitial extends GetRaterInfoState {}

class GetRaterInfoLoadingState extends GetRaterInfoState {}

class GetRaterInfoSuccessState extends GetRaterInfoState {
  final UserModel userModel;
  const GetRaterInfoSuccessState({required this.userModel});
}

class GetRaterInfoFailureState extends GetRaterInfoState {
  final String errorMessage;
  const GetRaterInfoFailureState({required this.errorMessage});
}
