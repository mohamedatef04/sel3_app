part of 'insert_new_password_cubit.dart';

abstract class InsertNewPasswordState extends Equatable {
  const InsertNewPasswordState();

  @override
  List<Object> get props => [];
}

class InsertNewPasswordInitial extends InsertNewPasswordState {}

class InsertNewPasswordLoadingState extends InsertNewPasswordState {}

class InsertNewPasswordSuccessState extends InsertNewPasswordState {}

class InsertNewPasswordFailureState extends InsertNewPasswordState {
  final String errorMessage;

  const InsertNewPasswordFailureState({required this.errorMessage});
}
