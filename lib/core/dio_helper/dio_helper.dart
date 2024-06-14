import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import '../app_storage/app_storage.dart';

class DioHelper {

  static final _baseUrl =  BASE_URL;
  static late Dio dioSingleton;
  static String? lang ;
  static String? deviceToken ;

  static Future<void> init() async {
    // dioSingleton = Dio() .. options.baseUrl = "$_baseUrl";
    dioSingleton = Dio() .. options.connectTimeout = Duration(seconds: 300);
    dioSingleton = Dio() .. options.connectTimeout = Duration(seconds: 300);
    dioSingleton.options.headers.addAll({
      'Accept':"application/json",
      "Accept-Language":lang,

    });
    dioSingleton.options.validateStatus = (v)=> v! < 500;
  }

  static Future<Response<dynamic>> post(String path,{FormData? formData,Map<String, dynamic>? body}){
    dioSingleton.options.headers.addAll({
      'Accept':"application/json",
      "Accept-Language":lang,
      if(AppStorage.isLogged)
        'Authorization': 'Bearer ${AppStorage.getToken}',
    });
    final response = dioSingleton.post("${_baseUrl+path}",data: formData != null ?
    formData : FormData.fromMap(body!));
    // dio.options.headers = null;
    return response;
  }

  static Future<Response<dynamic>> get(String path){
    dioSingleton.options.headers.addAll({

      'Accept':"application/json",
      "Accept-Language":lang,

      if(AppStorage.isLogged)
        'Authorization': 'Bearer ${AppStorage.getToken}'
    });
    final response = dioSingleton.get("${_baseUrl+path}");
    // dio.options.headers = null;a
    return response;
  }

  static Future<Response<dynamic>> delete(String path){
    dioSingleton.options.headers.addAll({

      'Accept':"application/json",
      "Accept-Language":lang,

      if(AppStorage.isLogged)
        'Authorization': 'Bearer ${AppStorage.getToken}'
    });
    final response = dioSingleton.delete("${_baseUrl+path}");
    // dio.options.headers = null;a
    return response;
  }

}