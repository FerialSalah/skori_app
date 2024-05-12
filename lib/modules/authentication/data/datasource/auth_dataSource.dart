import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/network/urls_app.dart';
import '../model/user_model.dart';
import 'base_dataSoruce_auth.dart';


class AuthDataSource extends BaseDataSourceAuth {

  @override
  Future<Unit> login({required String email,required String password}) async {
    print("the password ======${password}");
    print("the code ======${email}");
    try {
      final response = await DioHelper.post("${LOGIN_URL_AUTH}", body: {
        "email": email,
        "password": password
      });
      print(response.data);
      print("states:=========${response.statusCode}");
      if(response.statusCode==200||response.statusCode==201){
        UserModel userModel= UserModel.fromJson(response.data['data']);
        AppStorage.cacheUser(userModel);
        AppStorage.cacheToken(response.data['token']);
        return unit;
      }else{
        throw ExceptionServiceCallBack( massage: response.data['message'],);
      }
    } on DioException catch (e) {
      throw handleResponseError(e);
    }
  }

  @override
  Future<Unit> signUp({required String firstName,required String lastName,
    required String email ,required String phone, required String gender,
    required String birthDate,
    required String password, required String confirmPassword}) async {
    try {
      print(phone);
      final response = await DioHelper.post(SIGNUP_URL_AUTH, body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        if(phone.isNotEmpty)
        'phone': phone,
        if(gender.isNotEmpty)
        'gender': gender,
        if(birthDate.isNotEmpty)
          'birthdate': birthDate,
        'type': 'fan',
        'password': password,
        'password_confirmation': confirmPassword
      });
       if(response.statusCode==422){
         throw ExceptionServiceAuthentication( errors: response.data['errors'],);
        }else if(response.statusCode==200){
         UserModel userModel= UserModel.fromJson(response.data['data']);
         AppStorage.cacheUser(userModel);
         AppStorage.cacheToken(response.data['token']);
         return unit;
       }else{
         throw ExceptionServiceCallBack(massage: response.data['message']);
       }
    } on DioError catch (e) {
      print("e.message");
      print(e.message);
      print(e.response!.statusCode);
      throw handleResponseError(e);
    }
  }



  @override
  Future<UserModel> verifyOtp({required String phone, required String code,required String otp}) async{
    print(phone);
    print(code);
    print(otp);

    try {
      final response = await DioHelper.post(OTP_URL_AUTH,
          body: {
            "phone": phone,
            "country_code": code,
            "otp": otp,
          });
        print(response.data);
      UserModel userModel= UserModel.fromJson(response.data['data']['user']);
      // AppStorage.cacheUser(userModel);
      AppStorage.cacheToken(response.data['data']['user']['token']);
      // print(AppStorage.getUserModel.phone);
      return userModel;
    } on DioError catch (e) {
      throw handleResponseError(e);
    }

  }

  @override
  Future<Unit> forgetPassword({required String email}) async{
    print("The phone=======${email}");
    try {
      final response = await DioHelper.post(FORGET_PASSWORD_URL_AUTH,
          body: {
            "email": email,
          });
      print(response.statusCode);
      print(response.statusCode);
      if(response.statusCode==200||response.statusCode==201){
        print(response.data);
        return unit;
      }else if(response.statusCode==422){
        throw ExceptionServiceAuthentication( errors: response.data['errors'],);
      }else {
        throw ExceptionServiceCallBack( massage: response.data['message'],);
      }
    } on DioError catch (e) {
      throw handleResponseError(e);
    }

  }


  @override
  Future<Unit> resetPassword({required String resetToken,
    required String password, required String confirmPassword}) async{

    try {
      final response = await DioHelper.post(RESET_PASSWORD_URL_AUTH,
          body: {
             "token":resetToken,
            "password": password,
            "password_confirmation": confirmPassword,

          });
      print(response.data);
      if(response.statusCode==422){
        throw ExceptionServiceAuthentication( errors: response.data['errors'],);
      }else if(response.statusCode==200){
        print(response.data);
        return unit;
      }else{
        throw ExceptionServiceCallBack(massage: response.data['message']);
      }
    } on DioError catch (e) {
      throw handleResponseError(e);
    }

  }
  @override
  List<Object?> get props => throw UnimplementedError();


}