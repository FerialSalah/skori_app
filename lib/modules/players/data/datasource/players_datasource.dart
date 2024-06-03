
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/news/data/model/news_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/player_history_model.dart';
import '../model/player_new_statistics_model.dart';
import '../model/player_statistics_model.dart';
import '../model/players_model.dart';



abstract class BasePlayersDataSource{
  Future<PlayersModel> getPlayers({required int page,String? teamId,String? countryId,String? playerName});
  Future<PlayerModel> getPlayerInfo({required int id,});
  Future<PlayerStatisticsModel> getPlayerStatistics({required int id,});
  Future<PlayerNewStatisticsData> getPlayerNewStatistics({required int id, String? tournamentId, String? seasonId});

  Future<PlayerHistoryModel> getPlayerHistory({required int id,});
  Future<AllNewsModel> getPlayerNews({required int id,});
}

class PlayersDataSource implements BasePlayersDataSource{
  //
  @override
  Future<PlayersModel> getPlayers({required int page,String? teamId,String? countryId,String? playerName}) async{
    try {

      final result = await DioHelper.get("${PLAYERS_URL}?page=$page&name=${playerName??""}&country_id=${countryId??""}&team_id=${teamId??""}");
      PlayersModel response = PlayersModel.fromJson(result.data);
      print(teamId);
      print(result.data);
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<PlayerModel> getPlayerInfo({required int id}) async{
    try {
      print("URL=============${PLAYERS_URL}/$id");

      final result = await DioHelper.get("${PLAYERS_URL}/$id");
      PlayerModel response = PlayerModel.fromJson(result.data['data']);
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
  Future<PlayerStatisticsModel> getPlayerStatistics({required int id}) async{
    try {
      final result = await DioHelper.get("${PLAYERS_URL}/$id${STATISTICS_URL}");
      print("player statistics data:${result.data}");
      if(result.statusCode==200||result.statusCode==201){
        PlayerStatisticsModel response = PlayerStatisticsModel.fromJson(result.data);
        return response;
      }else if(result.statusCode==401){
        throw ExceptionServiceCallBack(massage: "You should sign up to see this articles");
      }else{
        throw ExceptionServiceCallBack(massage: result.data['message']);
      }
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }


  @override
  Future<PlayerNewStatisticsData> getPlayerNewStatistics({required int id, String? tournamentId, String? seasonId}) async{
    try {
      print("Player New Statistics URL=============${PLAYERS_URL}/$id${NEW_STATISTICS_URL}?tournament_id=${tournamentId??""}&season_id=${seasonId??""}");

      final result = await DioHelper.get("${PLAYERS_URL}/$id${NEW_STATISTICS_URL}?tournament_id=${tournamentId??""}&season_id=${seasonId??""}");
      print("player  new statistics data:${result.data}");
      if(result.statusCode==200||result.statusCode==201){
        PlayerNewStatisticsData response = PlayerNewStatisticsData.fromJson(result.data['data']);
        print(response);
        return response;
      }else if(result.statusCode==401){
        throw ExceptionServiceCallBack(massage: "You should sign up to see this articles");
      }else{
        throw ExceptionServiceCallBack(massage: result.data['message']);
      }
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }
  @override
  Future<PlayerHistoryModel> getPlayerHistory({required int id}) async{
    try {
      print("------------------------------------------------------------------$id");
      final result = await DioHelper.get("${PLAYERS_URL}/$id${TEAMS_URL}");
      print(result.data);

      PlayerHistoryModel response = PlayerHistoryModel.fromJson(result.data);
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
  Future<AllNewsModel> getPlayerNews({required int id}) async{
    try {
      final result = await DioHelper.get("${NEWS_URL}/$id${PLAYER_NEWS_URL}");
      print(result.data);
      print("------------------------------------------------------------------");
      AllNewsModel response = AllNewsModel.fromJson(result.data);

      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }


}
