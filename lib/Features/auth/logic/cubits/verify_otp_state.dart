part of 'verify_otp_cubit.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

class VerifyOtpSuccessState extends VerifyOtpState {}

class VerifyOtpFailureState extends VerifyOtpState {
  final String errorMessage;

  const VerifyOtpFailureState({required this.errorMessage});
}
