
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/nav_bar/data/model/home_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/matches_model.dart';



abstract class BaseNavBarDataSource{
  Future<MatchesModel> getMatches({required int page,String? date,String? tournamentId,String? teamId, String? countryId, String? seasonId});
  Future<HomeModel> getHome();

}

class NavBarDataSource implements BaseNavBarDataSource{

  @override
  Future<MatchesModel> getMatches({required int page,String? date,String? tournamentId,String? teamId,String? countryId,String? seasonId}) async{

    try {
      print("=========${date}");
      print("url is ${"${MATCHES_URL}?page=$page&date=${date??" "}&tournament_id=${tournamentId??" "}&team_id=${teamId??""}&country_id=${countryId??""}&season_id=${seasonId??""}"}");
      final result = await DioHelper.get("${MATCHES_URL}?page=$page&date=${date??""}&tournament_id=${tournamentId??""}&team_id=${teamId??""}&country_id=${countryId??""}&season_id=${seasonId??""}");
      print("matches home data: ${result.data}");
      MatchesModel response = MatchesModel.fromJson(result.data);

      return response;
    } on DioException catch (e) {
       print(runtimeType);
       print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<HomeModel> getHome() async{

    try {
      final result = await DioHelper.get("${HOME_URL}");
      print("--------------------------------------------------------------");
      print("home players: ${result.data["players"][0]["fifa_card"]}");
      HomeModel response = HomeModel.fromJson(result.data);
      print(result.data);

      print("stutaas========${result.statusCode}");
      return response;
    } on DioException catch (e) {
      print(runtimeType);
      print(e.response);
      throw handleResponseError(e);
    }
  }
}
