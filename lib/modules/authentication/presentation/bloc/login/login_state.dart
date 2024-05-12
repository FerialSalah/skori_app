// part of 'update_profile_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginField extends LoginState {
  final String msg;
  LoginField(this.msg);
}

class LoginOffline extends LoginState {
  final String msg;
  LoginOffline(this.msg);
}
