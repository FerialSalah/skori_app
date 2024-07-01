import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../model/user_model.dart';

abstract class BaseDataSourceAuth extends Equatable {
  Future<Unit> login({required String email,required String password, String? firebaseId});
  Future<Unit> signUp({required String firstName,required String lastName,required String birthDate,
    required String email ,required String phone, required String gender,
    required String password, required String confirmPassword});
  Future<UserModel> verifyOtp({required String phone, required String code, required String otp});
  Future<Unit> forgetPassword({required String email,});
  Future<Unit> resetPassword({required String resetToken,
    required String password, required String confirmPassword});


}
