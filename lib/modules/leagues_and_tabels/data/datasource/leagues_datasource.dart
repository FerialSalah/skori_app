
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/leagues_and_tabels/data/model/table_model.dart';
import 'package:skori/modules/news/data/model/news_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/league_discipline_model.dart';
import '../model/league_preformance_model.dart';
import '../model/league_tops_model.dart';
import '../model/leagues_model.dart';



abstract class BaseLeaguesDataSource{
   Future<LeaguesModel> getLeagues({required int page,});
   Future<TablesModel> getTable({required int id,});
   Future<AllNewsModel> getLeagueNews({required int page,required int id});
   Future<AllNewsModel> getLeagueGallery({required int page,required int id});

   Future<LeaguesTopsModel>getLeagueTopScores({required int id ,required String seasonId});
   Future<LeaguesTopsModel>getLeagueTopAssists({required int id ,required String seasonId});
   Future<LeagueDisciplinesModel>getLeagueStatisticsDiscipline({required int id ,required String seasonId});
   Future<LeaguesPerformancesModel>getLeagueStatisticsPerformance({required int id ,required String seasonId});


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
    } on DioException catch (e) {
       print(runtimeType);
       print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<TablesModel> getTable({required int id}) async{
    try {
      final result = await DioHelper.get("${LEAGUES_URL}/$id${STAGES_URL}");
      TablesModel response = TablesModel.fromJson(result.data);
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
  Future<AllNewsModel> getLeagueNews({required int page,required int id}) async{
    try {
      print("${NEWS_URL}/$id${LEAGUE_NEWS_URL}?page=$page");
      final result = await DioHelper.get("${NEWS_URL}/$id${LEAGUE_NEWS_URL}?page=$page");
      AllNewsModel response = AllNewsModel.fromJson(result.data);
      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }

  @override
  Future<LeagueDisciplinesModel> getLeagueStatisticsDiscipline({required int id,required String seasonId}) async{
    try {
      final result = await DioHelper.get("${LEAGUES_URL}/$id${LEAGUE_DISCIPLINE_URL}?season_id=${seasonId??""}");
      LeagueDisciplinesModel response = LeagueDisciplinesModel.fromJson(result.data);
      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }
  @override
  Future<LeaguesPerformancesModel> getLeagueStatisticsPerformance({required int id,required String seasonId}) async{
    try {
      final result = await DioHelper.get("${LEAGUES_URL}/$id${LEAGUE_PERFORMANCE_URL}?season_id=${seasonId??""}");
      LeaguesPerformancesModel response = LeaguesPerformancesModel.fromJson(result.data);
      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }

  @override
  Future<LeaguesTopsModel> getLeagueTopAssists({required int id, required String seasonId}) async {
    try {
      final result = await DioHelper.get("${LEAGUES_URL}/$id${LEAGUE_TOP_ASSIST_URL_}?season_id=${seasonId??""}");
      LeaguesTopsModel response = LeaguesTopsModel.fromJson(result.data);
      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }

  @override
  Future<LeaguesTopsModel> getLeagueTopScores({required int id, required String seasonId}) async {
    try {
      final result = await DioHelper.get("${LEAGUES_URL}/$id${LEAGUE_TOP_SCORE_URL}?season_id=${seasonId??""}");
      LeaguesTopsModel response = LeaguesTopsModel.fromJson(result.data);
      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }

  @override
  Future<AllNewsModel> getLeagueGallery({required int page, required int id}) {
    // TODO: implement getLeagueGallery
    throw UnimplementedError();
  }
}
