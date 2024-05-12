import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent  {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordCall extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;

  ChangePasswordCall( { required this.oldPassword, required this.newPassword,required this.newPasswordConfirm,} );
}
