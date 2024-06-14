import 'package:dio/dio.dart';
import 'package:skori/core/dio_helper/dio_helper.dart';
import 'package:skori/core/network/urls_app.dart';

import '../../../../core/errors/exception.dart';
import '../model/transfer_model.dart';

abstract class BaseTransfersDataSource{
  Future<TransfersModel> getTransfers({required int page,String? playerName,String? teamName,String? tournamentId,String? playerId, String? teamId, String? seasonId });


}

class TransfersDatasource implements BaseTransfersDataSource{
  @override
  Future<TransfersModel> getTransfers({required int page, String? playerName, String? teamName, String? tournamentId, String? playerId, String? teamId, String? seasonId}) async {
    try {
      print("${TRANSFERS_URL}?page=$page&player_id=${playerId??""}&team_id=${teamId??""}&tournament_id=${tournamentId??""}&season_id=${seasonId??""}&team_name=${teamName??""}&player_name=${playerName??""}");
      dynamic result = await DioHelper.get("${TRANSFERS_URL}?page=$page&player_id=${playerId??""}&team_id=${teamId??""}&tournament_id=${tournamentId??""}&season_id=${seasonId??""}&team_name=${teamName??""}&player_name=${playerName??""}");
      print("result:${result.data}");
      TransfersModel response = TransfersModel.fromJson(result.data);
      print("transfers data:$result");
      print("transfers response:$response");
      return response;
    } on DioException catch (e) {

      throw handleResponseError(e);
    }
  }

}