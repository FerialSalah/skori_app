
import 'package:skori/modules/leagues_and_tabels/data/model/leagues_model.dart';
import 'package:skori/modules/news/data/model/news_model.dart';
import 'package:skori/modules/players/data/model/players_model.dart';
import 'package:skori/modules/teams/data/model/team_model.dart';
import 'package:skori/modules/transfers/data/model/transfer_model.dart';
import '../../domain/entity/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel({
    required super.newResults,
    // required super.newResultsCount,
    required super.playerResults,
    // required super.playerResultsCount,
    required super.teamResults,
    // required super.teamResultsCount,
    // required super.leaguesResultsCount,
    required super.leaguesResults,
    required super.transfersResults
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    // newResultsCount:json["newResultsCount"] ,
    newResults: List<NewsModel>.from(json["newResults"].map((x) => NewsModel.fromJson(x))),
    // playerResultsCount: json["playerResultsCount"],
    playerResults: List<PlayerModel>.from(json["playerResults"].map((x) => PlayerModel.fromJson(x))),
    // teamResultsCount: json["teamResultsCount"],
    teamResults:  List<TeamModel>.from(json["teamResults"].map((x) => TeamModel.fromJson(x))),
    // leaguesResultsCount: json["tournamentResultsCount"],
    leaguesResults:  List<LeagueModel>.from(json["tournamentResults"].map((x) => LeagueModel.fromJson(x))),
    transfersResults:  List<TransferModel>.from(json["playerTransferResults"].map((x) => TransferModel.fromJson(x)))
  );

}






