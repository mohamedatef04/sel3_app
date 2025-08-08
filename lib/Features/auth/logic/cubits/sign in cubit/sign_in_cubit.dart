import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    try {
      await authRepo.signIn(
        email: email,
        password: password,
      );
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState(e.toString()));
    }
  }
}
