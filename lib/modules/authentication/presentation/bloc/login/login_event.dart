
abstract class LoginEvent  {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginCall extends LoginEvent {
  final String email;
  final String password;
   String? firebaseId;

  LoginCall({required this.email, required this.password,this.firebaseId});
}
