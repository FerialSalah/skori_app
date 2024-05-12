
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/nav_bar/data/model/matches_model.dart';
import 'package:skori/modules/news/data/model/news_model.dart';
import 'package:skori/modules/players/data/model/players_model.dart';
import 'package:skori/modules/teams/data/model/team_statistics_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/team_model.dart';




abstract class BaseTeamsDataSource{
   Future<TeamsModel> getTeams({required int page,String? teamName,String? tournamentId,String? countryId});
   Future<TeamsModel> getFilterTeams({ String? tournamentId});

   Future<MatchesModel> getTeamMatches({required int id});
   Future<TeamStatisticsModel> getTeamStatistics({required int id});
   Future<AllNewsModel> getTeamNews({required int id});
   Future<PlayersModel> getTeamPlayers({required int id});
}

class TeamsDataSource implements BaseTeamsDataSource{
  @override
  Future<TeamsModel> getTeams({required int page,String? teamName,String? tournamentId,String? countryId}) async{
    try {
      final result = await DioHelper.get("${TEAMS_URL}?page=$page&tournament_id=${tournamentId??""}&country_id=${countryId??""}&name=${teamName??""}");
      TeamsModel response = TeamsModel.fromJson(result.data);

      return response;
    } on DioError catch (e) {

      throw handleResponseError(e);
    }
  }
  Future<TeamsModel> getFilterTeams({String? tournamentId}) async{
    try {
      print("${FILTER_TEAMS_URL}?tournament_id=${tournamentId??""}");
      final result = await DioHelper.get("${FILTER_TEAMS_URL}?tournament_id=${tournamentId??""}");
      print("fliter team :$result");
      TeamsModel response = TeamsModel.fromJson(result.data);

      return response;
    } on DioError catch (e) {

      throw handleResponseError(e);
    }
  }

  @override
  Future<MatchesModel> getTeamMatches({required int id}) async{
    try {
      final result = await DioHelper.get("${TEAMS_URL}/$id${MATCHES_URL}");
      MatchesModel response = MatchesModel.fromJson(result.data);
       print(result.data);
      return response;
    } on DioError catch (e) {

      throw handleResponseError(e);
    }
  }
  @override
  Future<TeamStatisticsModel> getTeamStatistics({required int id}) async{
    try {
      final result = await DioHelper.get("${TEAMS_URL}/$id${STATISTICS_URL}");
      if(result.statusCode==200||result.statusCode==201){
        TeamStatisticsModel response = TeamStatisticsModel.fromJson(result.data);
        return response;
      }else if(result.statusCode==401){
        throw ExceptionServiceCallBack(massage: LocaleKeys.shouldSignUp.tr());
      }else{
        throw ExceptionServiceCallBack(massage: result.data['message']);
      }


    } on DioError catch (e) {
      throw handleResponseError(e);
    }
  }
  @override
  Future<AllNewsModel> getTeamNews({required int id}) async{
    try {
      final result = await DioHelper.get("${NEWS_URL}/$id${TEAM_NEWS_URL}");
      AllNewsModel response = AllNewsModel.fromJson(result.data);
      return response;
    } on DioError catch (e) {

      throw handleResponseError(e);
    }
  }
  @override
  Future<PlayersModel> getTeamPlayers({required int id}) async{
    try {
      final result = await DioHelper.get("${TEAMS_URL}/$id${PLAYERS_URL}");
      print("url :${TEAMS_URL}/$id${PLAYERS_URL}");
      PlayersModel response = PlayersModel.fromJson(result.data);
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
