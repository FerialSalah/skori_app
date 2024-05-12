import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/user_entity.dart';
import '../repository/base_auth_repository.dart';

class AuthUseCase {
  final BaseRepositoryAuth baseRepositoryAuth;

  AuthUseCase( this.baseRepositoryAuth);
  ///login
  Future<Either<Failure, Unit>> loginCall(
          {required String email,required String password}) async =>
      baseRepositoryAuth.login(email:email,password: password);

///Sign_up
  Future<Either<Failure, Unit>> signUpCall(
      {required String firstName,required String lastName,required String email ,required String phone,required  String gender,
        required String password, required String confirmPassword,required String birthDate}) async =>
      baseRepositoryAuth.signUp(firstName: firstName, lastName: lastName,gender: gender,phone: phone,
      password: password,confirmPassword: confirmPassword,email: email,birthDate: birthDate);


  ///otp
  Future<Either<Failure, UserEntity>> OtpCall(
      {required String phone,
        required String code,
        required String otp,
      }) async =>
      baseRepositoryAuth.otp(phone: phone, code: code,otp: otp);

///forget Password
  Future<Either<Failure, Unit>> forgetPassword(
      {required String email,

      }) async =>
      baseRepositoryAuth.forgetPassword(email: email);


  ///reset Password
  Future<Either<Failure, Unit>> resetPassword(
      {required String resetToken,
        required String password, required String confirmPassword}) async =>
      baseRepositoryAuth.resetPassword(resetToken: resetToken,
      password: password,confirmPassword:confirmPassword);
}
