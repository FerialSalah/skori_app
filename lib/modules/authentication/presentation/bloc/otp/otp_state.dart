part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpSuccess extends OtpState {
  final String massage;

  OtpSuccess(this.massage);
}

class OtpField extends OtpState {
  final String massage;
  OtpField(this.massage);
}

class OtpLoading extends OtpState {}


class OtpOffline extends OtpState {
  final String msg;
  OtpOffline(this.msg);
}
