import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/search_model.dart';



abstract class BaseSearchDataSource{
   Future<SearchModel> getSearch({required String key,required String type,});
}

class SearchDataSource implements BaseSearchDataSource{
  @override
  Future<SearchModel> getSearch({required String key,required String type}) async{
    try {
      final result = await DioHelper.get("${SEARCH_URL}?search_type=$type&search_value=$key");
      print("player search: ${result.data}");
      SearchModel response = SearchModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioError catch (e) {
       print(runtimeType);
       print(e.response);
      throw handleResponseError(e);
    }
  }

}
