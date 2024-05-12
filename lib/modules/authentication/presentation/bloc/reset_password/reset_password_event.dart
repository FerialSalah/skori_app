
import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class SendResetPasswordEvent extends ResetPasswordEvent {

  final String resetToken;
  final String password;
  final String confirmPassword;

  SendResetPasswordEvent({required this.resetToken, required this.password,
    required this.confirmPassword,});
}
