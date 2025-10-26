part of 'create_account_cubit.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();

  @override
  List<Object> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoadingState extends CreateAccountState {}

class CreateAccountSuccessState extends CreateAccountState {}

class CreateAccountFailureState extends CreateAccountState {
  final String errorMessage;

  const CreateAccountFailureState({required this.errorMessage});
}
