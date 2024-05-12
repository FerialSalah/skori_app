
import 'package:equatable/equatable.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class SendForgetPasswordEvent extends ForgetPasswordEvent {
  final String email;

  SendForgetPasswordEvent({required this.email});
}
