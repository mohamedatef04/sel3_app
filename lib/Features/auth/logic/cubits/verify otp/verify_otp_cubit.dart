import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this.authRepo) : super(VerifyOtpInitial());

  final AuthRepo authRepo;

  Future<void> verifyOtp({
    required String otp,
    required String phone,
  }) async {
    emit(VerifyOtpLoadingState());
    try {
      await authRepo.verifyTheOtpSent(otp: otp, phone: phone);
      emit(VerifyOtpSuccessState());
    } catch (e) {
      emit(VerifyOtpFailureState(errorMessage: e.toString()));
    }
  }
}
