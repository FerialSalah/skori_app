import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/user_entity.dart';




abstract class BaseRepositoryAuth extends Equatable {
  Future<Either<Failure, Unit>> login({required String email,required String password});

  Future<Either<Failure, Unit>> signUp({required String firstName,required String lastName,
    required String email ,required String phone, required String gender,required String birthDate,
    required String password, required String confirmPassword});

  Future<Either<Failure, UserEntity>> otp({
    required String phone,
    required String code,
    required String otp,
  });

  Future<Either<Failure, Unit>> forgetPassword({
    required String email,


  });
Future<Either<Failure, Unit>> resetPassword({required String resetToken,
  required String password, required String confirmPassword});

}
