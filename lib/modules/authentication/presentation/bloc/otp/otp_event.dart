part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyOtpEvent extends OtpEvent {
  final String phone;
  final String code;
  final String otp;

  VerifyOtpEvent({required this.phone, required this.code, required this.otp});
}
