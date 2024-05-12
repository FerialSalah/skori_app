import 'package:dartz/dartz.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../datasource/base_dataSoruce_auth.dart';

class ImpRepositoryAuth extends BaseRepositoryAuth{
  final BaseDataSourceAuth baseDataSourceAuth;
  final NetworkChecker networkChecker;
  ImpRepositoryAuth(this.baseDataSourceAuth, this.networkChecker);


  @override
  Future<Either<Failure, Unit>> login({required String email,required String password}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseDataSourceAuth.login(
          email: email, password: password);
        return Right(unit);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }



  @override
  Future<Either<Failure, Unit>> signUp({required String firstName,required String lastName,
    required String email ,required String phone, required String gender,required String birthDate,
    required String password, required String confirmPassword}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseDataSourceAuth.signUp(
            firstName: firstName, lastName: lastName,gender: gender,phone: phone,
            password: password,confirmPassword: confirmPassword,email: email,birthDate: birthDate);
        return Right(unit);
      }  on ExceptionServiceAuthentication catch(e){
        return Left(FailureServiceValidation(errors: e.errors));
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }



  @override
  Future<Either<Failure, UserEntity>> otp({
    required String phone,
    required String code,
    required String otp}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseDataSourceAuth.verifyOtp(
            code: code, phone: phone,otp: otp);
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }

  }


  @override
  Future<Either<Failure, Unit>> forgetPassword({
    required String email,

   }) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseDataSourceAuth.forgetPassword(
           email:email );
        return Right(result);
      } on ExceptionServiceAuthentication catch(e){
        return Left(FailureServiceValidation(errors: e.errors));
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }

  }


@override
Future<Either<Failure, Unit>> resetPassword({required String resetToken,
  required String password, required String confirmPassword}) async {
  if (await networkChecker.isDeviceConnected) {
    try {
      final result = await baseDataSourceAuth.resetPassword(
         resetToken: resetToken,password: password,confirmPassword: confirmPassword);
      return Right(unit);
    }  on ExceptionServiceAuthentication catch(e){
      return Left(FailureServiceValidation(errors: e.errors));
    } on ExceptionServiceCallBack catch (e) {
      return Left(FailureServiceWithResponse(msg: e.massage));
    }
  } else {
    return Left(FailureOffline());
  }

}
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
