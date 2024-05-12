import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// SERVER
class FailureService extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureServiceWithResponse extends Failure {
  final String msg;

  FailureServiceWithResponse({required this.msg});
  @override
  List<Object?> get props => [msg];
}

// AUTHENTICATION
class FailureServiceValidation extends Failure {
  final Map<String, dynamic> errors;

  FailureServiceValidation({required this.errors});

  @override
  List<Object?> get props => [errors];
}

class FailureServiceAuthorized extends Failure {
  final String msg;

  FailureServiceAuthorized({required this.msg});
  @override
  List<Object?> get props => [msg];
}

// NETWORK CONNECTION
class FailureOffline extends Failure {
  @override
  List<Object?> get props => [];
}

// LOCAL DATABASE
class FailureEmptyCache extends Failure {
  @override
  List<Object?> get props => [];
}
