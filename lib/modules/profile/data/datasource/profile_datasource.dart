

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/leagues_and_tabels/data/model/leagues_model.dart';
import 'package:skori/modules/news/data/model/news_model.dart';
import 'package:skori/modules/profile/data/model/notification_model.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../../../authentication/data/model/user_model.dart';
import '../../../players/data/model/players_model.dart';
import '../../../teams/data/model/team_model.dart';



abstract class BaseProfileDataSource{

  Future<Unit> editProfile({required String firstName,required String lastName,required String email ,
    required String phone, required String gender,});
  Future<Unit> changePassword({required String oldPassword, required String newPassword,required String newPasswordConfirm});
   Future<PlayersModel> getFollowingPlayers({required int page,});
   Future<TeamsModel> getFollowingTeams({required int page,});
   Future<LeaguesModel> getFollowingLeagues({required int page,});

   Future<PlayersModel> getFavoritesPlayers({required int page,});
   Future<TeamsModel> getFavoritesTeams({required int page,});
  Future<LeaguesModel> getFavoritesLeagues({required int page,});
  Future<AllNewsModel> getFavoritesNews({required int page,});

  Future<NotificationsModel> getNotifications();
   Future<Unit> contactUs({required String name, required String email,required String message});
  Future<Unit> deleteNotification({required String id});
}

class ProfileDataSource implements BaseProfileDataSource{



  @override
  Future<Unit> editProfile({required String firstName,required String lastName,
    required String email ,required String phone, required String gender,
    }) async {
    try {
      print(phone);
      final response = await DioHelper.post(PROFILE_URL, body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'gender': gender,

      });
      if(response.statusCode==200){
        UserModel userModel= UserModel.fromJson(response.data['data']);
        AppStorage.cacheUser(userModel);
        return unit;
      }else{
        throw ExceptionServiceCallBack(massage: response.data['message']);
      }
    } on DioException catch (e) {
      print("e.message");
      print(e.message);
      print(e.response!.statusCode);
      throw handleResponseError(e);
    }
  }


  @override
  Future<Unit> changePassword({required String oldPassword,required String newPassword,required String newPasswordConfirm}) async {
    try {
      print(oldPassword);
      print(newPassword);
      final response = await DioHelper.post(CHANGE_PASSWORD_URL, body: {
        'old_password': oldPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirm
      });
      if(response.statusCode==422){
        throw ExceptionServiceAuthentication( errors: response.data['errors'],);
      }else if(response.statusCode==200){

        return unit;
      }else{
        throw ExceptionServiceCallBack(massage: response.data['message']);
      }
    } on DioException catch (e) {
      print("e.message");
      print(e.message);
      print(e.response!.statusCode);
      throw handleResponseError(e);
    }
  }
  //
  @override
  Future<PlayersModel> getFollowingPlayers({required int page}) async{
    try {
      final result = await DioHelper.get("${FOLLOWING_PLAYERS_URL}?page=$page");
      PlayersModel response = PlayersModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
       print(runtimeType);
       print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<TeamsModel> getFollowingTeams({required int page}) async{
    try {
      final result = await DioHelper.get("${FOLLOWING_TEAMS_URL}?page=$page");
      TeamsModel response = TeamsModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<LeaguesModel> getFollowingLeagues({required int page}) async{
    try {
      final result = await DioHelper.get("${FOLLOWING_LEAGUES_URL}?page=$page");
      LeaguesModel response = LeaguesModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<PlayersModel> getFavoritesPlayers({required int page}) async{
    try {
      final result = await DioHelper.get("${FAVORITES_PLAYERS_URL}?page=$page");
      PlayersModel response = PlayersModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<TeamsModel> getFavoritesTeams({required int page}) async{
    try {
      final result = await DioHelper.get("${FAVORITES_TEAMS_URL}?page=$page");
      TeamsModel response = TeamsModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<LeaguesModel> getFavoritesLeagues({required int page}) async{
    try {
      final result = await DioHelper.get("${FAVORITES_LEAGUES_URL}?page=$page");
      LeaguesModel response = LeaguesModel.fromJson(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<AllNewsModel> getFavoritesNews({required int page}) async{
    try {
      final result = await DioHelper.get("${FAVORITES_NEWS_URL}?page=$page");
      AllNewsModel response = AllNewsModel.fromJson(result.data);
      print("stutaas========${result.statusCode}");
      print("favorite news : ${response}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<NotificationsModel> getNotifications() async{
    try {
      final result = await DioHelper.get("${NOTIFICATIONS_URL}");
      NotificationsModel response = NotificationsModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }


  @override
  Future<Unit> contactUs({required String name, required String email,required String message}) async {
    try {

      final response = await DioHelper.post(CONTACT_US_URL, body: {
        'name': name,
        'email': email,
        'message': message
      });
      if(response.statusCode==200){
        return unit;
      }else{
        throw ExceptionServiceCallBack(massage: response.data['message']);
      }
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }

  @override
  Future<Unit> deleteNotification({required String id}) async {
    print("${NOTIFICATIONS_URL}/${id}");
    try {
      final result = await DioHelper.delete("${NOTIFICATIONS_URL}/${id}");
      print(result.statusCode);
      if(result.statusCode==200){
        print(result.data);
        return unit;
      }else{
        throw ExceptionServiceCallBack(massage: result.data['message']);
      }


    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

}
