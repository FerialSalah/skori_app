// part of 'update_profile_bloc.dart';

abstract class ChangePasswordState  {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {}

class ChangePasswordField extends ChangePasswordState {
  final String msg;
  ChangePasswordField(this.msg);
}
class ChangePasswordValidate extends ChangePasswordState {
  final Map<String,dynamic> errors;
  ChangePasswordValidate(this.errors);
}

class ChangePasswordOffline extends ChangePasswordState {
  final String msg;
  ChangePasswordOffline(this.msg);
}
