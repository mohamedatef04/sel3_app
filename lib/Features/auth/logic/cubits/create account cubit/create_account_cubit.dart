import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this.authRepo) : super(CreateAccountInitial());

  final AuthRepo authRepo;

  Future<void> createNewAccount({
    required String email,
    required String password,
  }) async {
    emit(CreateAccountLoadingState());
    try {
      await authRepo.createNewAccount(
        email: email,
        password: password,
      );
      emit(CreateAccountSuccessState());
    } catch (e) {
      emit(CreateAccountFailureState(errorMessage: e.toString()));
    }
  }
}
