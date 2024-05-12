
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/matches/data/model/statistics_model.dart';
import 'package:skori/modules/nav_bar/data/model/home_model.dart';
import 'package:skori/modules/nav_bar/data/model/matches_model.dart';
import '../../../../../core/app_storage/app_storage.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/errors/exception.dart';



abstract class BaseMatchStatisticsDataSource{
  Future<StatisticsModel> getMatchStatistics({required int matchId});
  Future<MatchesModel>getPreviousMatches({required int homeTeamId,required int awayTeamId,required int matchId});
  Future<MatchesModel>getRecentMatches( {required int TeamId,required int matchId});


}

class MatchStatisticsDataSource implements BaseMatchStatisticsDataSource{

  @override
  Future<StatisticsModel> getMatchStatistics({required int matchId}) async{

    try {
      print("match statistic url :${"${MATCH_STATISTIC_URL}$matchId/statistics"}");
      final result = await DioHelper.get("${MATCH_STATISTIC_URL}$matchId/statistics");
      print("match Statistics: ${result.data}");
      StatisticsModel response = StatisticsModel.fromJson(result.data['data']);
      print(response.possession![0].value);

      return response;
    } on DioError catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<MatchesModel> getPreviousMatches({required int homeTeamId, required int awayTeamId, required int matchId}) async{
    try {
      print("match previous url :${"${MATCH_STATISTIC_URL}$homeTeamId/$awayTeamId/$matchId/previousMatches"}");

      final result = await DioHelper.get("${MATCH_STATISTIC_URL}$homeTeamId/$awayTeamId/$matchId/previousMatches");
      print("matches previous: ${result.data}");
      MatchesModel response = MatchesModel.fromJson(result.data);
      print(response);

      return response;
    } on DioError catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<MatchesModel> getRecentMatches({required int TeamId, required int matchId})async {
    try {
      print("match recent url :${"${RECENT_MATCHES_URL}$TeamId/$matchId/recentMatches"}");

      final result = await DioHelper.get("${MATCH_STATISTIC_URL}$TeamId/$matchId/recentMatches");
      print("matches recent: ${result}");
      MatchesModel response = MatchesModel.fromJson(result.data);
      print("matchs recents :$response");

      return response;
    } on DioError catch (e) {
      print(runtimeType);
      print(e.response);
      print("eeeeeeeerrroooooor");
      throw handleResponseError(e);
    }
  }
  }



