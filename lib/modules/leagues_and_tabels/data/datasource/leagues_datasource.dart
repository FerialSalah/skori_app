
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/leagues_and_tabels/data/model/table_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/leagues_model.dart';



abstract class BaseLeaguesDataSource{
   Future<LeaguesModel> getLeagues({required int page,});
   Future<TablesModel> getTable({required int id,});

}

class LeaguesDataSource implements BaseLeaguesDataSource{
  //
  @override
  Future<LeaguesModel> getLeagues({required int page}) async{
    try {
      final result = await DioHelper.get("${LEAGUES_URL}?page=$page");
      LeaguesModel response = LeaguesModel.fromJson(result.data);
      print(result.data);
      print("stutaas========${result.statusCode}");
      return response;
    } on DioError catch (e) {
       print(runtimeType);
       print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<TablesModel> getTable({required int id}) async{
    try {
      final result = await DioHelper.get("${LEAGUES_URL}/$id${TEAMS_URL}");
      TablesModel response = TablesModel.fromJson(result.data);
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
