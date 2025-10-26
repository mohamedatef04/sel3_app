part of 'send_phone_otp_cubit.dart';

abstract class SendPhoneOtpState extends Equatable {
  const SendPhoneOtpState();

  @override
  List<Object> get props => [];
}

class SendPhoneOtpInitial extends SendPhoneOtpState {}

class SendPhoneOtpLoadingState extends SendPhoneOtpState {}

class SendPhoneOtpSuccessState extends SendPhoneOtpState {}

class SendPhoneOtpFailureState extends SendPhoneOtpState {
  final String errorMessage;

  const SendPhoneOtpFailureState({required this.errorMessage});
}
