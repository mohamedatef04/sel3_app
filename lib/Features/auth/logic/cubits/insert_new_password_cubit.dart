import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'insert_new_password_state.dart';

class InsertNewPasswordCubit extends Cubit<InsertNewPasswordState> {
  InsertNewPasswordCubit(this.authRepo) : super(InsertNewPasswordInitial());

  final AuthRepo authRepo;

  Future<void> insertNewPassword({
    required String newPassword,
  }) async {
    emit(InsertNewPasswordLoadingState());
    try {
      await authRepo.changePassword(newPassword: newPassword);
      emit(InsertNewPasswordSuccessState());
    } catch (e) {
      emit(InsertNewPasswordFailureState(errorMessage: e.toString()));
    }
  }
}
