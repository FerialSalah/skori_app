// part of 'update_profile_bloc.dart';

abstract class SignUpState  {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpField extends SignUpState {
  final String msg;
  SignUpField(this.msg);
}
class SignUpValidate extends SignUpState {
  final Map<String,dynamic> errors;
  SignUpValidate(this.errors);
}

class SignUpOffline extends SignUpState {
  final String msg;
  SignUpOffline(this.msg);
}
