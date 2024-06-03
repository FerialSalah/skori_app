
abstract class SignUpEvent  {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class signUpCall extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String? phone;
  final String? birthDate;
  final String email;
  final String? gender;
  final String password;
  final String confirmPassword;

  signUpCall( {required this.firstName,required this.lastName, this.phone,this.birthDate,
    required this.email, this.gender,required this.password, required this.confirmPassword,} );
}
