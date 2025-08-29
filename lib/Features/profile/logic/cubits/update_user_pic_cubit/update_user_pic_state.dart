part of 'update_user_pic_cubit.dart';

abstract class UpdateUserPicState extends Equatable {
  const UpdateUserPicState();

  @override
  List<Object> get props => [];
}

class UpdateUserPicInitial extends UpdateUserPicState {}

class UpdateUserPicSuccessState extends UpdateUserPicState {}

class UpdateUserPicFailureState extends UpdateUserPicState {
  final String errorMessage;
  const UpdateUserPicFailureState({required this.errorMessage});
}
