
import 'package:dio/dio.dart';


class ExceptionService implements Exception {}

// SERVER
class ExceptionServiceCallBack implements Exception {
  final String massage;

  ExceptionServiceCallBack({required this.massage});
}

///Auth
class ExceptionServiceAuthentication implements Exception {
  final Map<String,dynamic> errors;
  ExceptionServiceAuthentication({required this.errors});
}

// CONNECTION NETWORK
class ExceptionOffline implements Exception {}

//LOCAL DATA BASE
class ExceptionEmptyCache implements Exception {}


Exception handleResponseError(DioException e) {
  if (e.response != null) {
    if (e.response!.statusCode == 404) {
      return ExceptionServiceCallBack(massage: "404 : Service Not found");
    } else if (e.response!.statusCode == 500) {
      return ExceptionServiceCallBack(massage: "500 :Service Field");
    } else {
      return ExceptionServiceCallBack(massage: e.toString());
    }
  } else {
    return ExceptionServiceCallBack(massage: e.toString());
  }
}