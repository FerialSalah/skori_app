import 'package:skori/modules/nav_bar/data/model/matches_model.dart';
import 'package:skori/modules/nav_bar/domain/entity/home_entity.dart';
import 'package:skori/modules/news/data/model/news_model.dart';
import 'package:skori/modules/players/data/model/players_model.dart';
import 'package:skori/modules/teams/data/model/team_model.dart';

import '../../../leagues_and_tabels/data/model/leagues_model.dart';

// class HomeDataModel {
//   HomeDataModel({
//     required this.data,
//   });
//
//   List<HomeModel> data;
//
//   factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
//     data: json["data"] == null ? [] : List<HomeModel>.from(json["data"]!.map((x) => HomeModel.fromJson(x))),
//   );
//
// }


class HomeModel extends HomeEntity {

  HomeModel({
    required super.liveMatches,
    required super.latestNews,
    required super.trendingNews,
    required super.tournaments,
    required super.teams,
    required super.players,

  });


  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    liveMatches: json['liveMatches'] == null ? []
        : (json['liveMatches'] as List).map((e) => MatchModel.fromJson(e)).toList(),
    latestNews: json['latestNews'] == null ? []
        : (json['latestNews'] as List).map((e) => NewsModel.fromJson(e)).toList(),
    trendingNews: json['trendingNews'] == null ? []
        : (json['trendingNews'] as List).map((e) => NewsModel.fromJson(e)).toList(),
    tournaments: json['tournaments'] == null ? []
        : (json['tournaments'] as List).map((e) => LeagueModel.fromJson(e)).toList(),
    teams: json['teams'] == null ? []
        : (json['teams'] as List).map((e) => TeamModel.fromJson(e)).toList(),
    players: json['players'] == null ? []
        : (json['players'] as List).map((e) => PlayerModel.fromJson(e)).toList(),


  );
}






