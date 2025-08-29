import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';

part 'send_phone_otp_state.dart';

class SendPhoneOtpCubit extends Cubit<SendPhoneOtpState> {
  SendPhoneOtpCubit(this.authRepo) : super(SendPhoneOtpInitial());
  final AuthRepo authRepo;

  Future<void> sendPhoneOtp({required String phone}) async {
    emit(SendPhoneOtpLoadingState());
    try {
      await authRepo.sendPhoneOtpToChangePassword(phone: phone);
      emit(SendPhoneOtpSuccessState());
    } catch (e) {
      emit(SendPhoneOtpFailureState(errorMessage: e.toString()));
    }
  }
}
