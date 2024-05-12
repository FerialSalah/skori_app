import 'package:skori/modules/players/data/model/player_statistics_model.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';

// class PlayerNewStatisticsModel {
//   PlayerNewStatisticsData playerNewStatistics;
//
//   PlayerNewStatisticsModel({
//     required this.playerNewStatistics,
//   });
//   factory PlayerNewStatisticsModel.fromJson(Map<String, dynamic> json) =>
//       PlayerNewStatisticsModel(
//         playerNewStatistics: PlayerNewStatisticsData.fromJson(json["data"]),
//       );
// }

class PlayerNewStatisticsData extends PlayerNewStatisticsEntity {
  PlayerNewStatisticsData(
      {required super.mainStats,
      required super.playerPerformance,
      required super.defensive,
      required super.ballLost,
      required super.administrative,
      required super.featuredStats,
      required super.offensive});

  factory PlayerNewStatisticsData.fromJson(Map<String, dynamic> json) =>
      PlayerNewStatisticsData(
        mainStats: json["main_stats"] == null
            ? []
            : List<StatisticValueModel>.from(json["main_stats"]!
                .map((x) => StatisticValueModel.fromJson(x))),
        playerPerformance: json['player_performance'] == null
            ? null
            : new PlayerPerformanceModel.fromJson(json['player_performance']),
        defensive: json["defensive"] == null
            ? []
            : List<StatisticAbsoluteValue>.from(
                json["defensive"]!.map((x) => StatisticAbsoluteValueModel.fromJson(x))),
        ballLost: json["ball_lost"] == null
            ? []
            : List<StatisticAbsoluteValue>.from(
                json["ball_lost"]!.map((x) => StatisticAbsoluteValueModel.fromJson(x))),
        offensive: json["offensive"] == null
            ? []
            : List<StatisticAbsoluteValue>.from(
                json["offensive"]!.map((x) => StatisticAbsoluteValueModel.fromJson(x))),
        administrative: json["administrative"] == null
            ? []
            : List<StatisticAbsoluteValue>.from(json["administrative"]!
                .map((x) => StatisticAbsoluteValueModel.fromJson(x))),
        featuredStats: json["featured_stats"] == null
            ? []
            : List<StatisticValueModel>.from(json["featured_stats"]!
                .map((x) => StatisticValueModel.fromJson(x))),
      );
}

class StatisticAbsoluteValueModel extends StatisticAbsoluteValue {
  StatisticAbsoluteValueModel({
    required super.name,
    required super.absoluteValue,
    required super.per90Value,
  });
  factory StatisticAbsoluteValueModel.fromJson(Map<String, dynamic> json) =>
      StatisticAbsoluteValueModel(
        name: json['name'],
        absoluteValue: json['absolute_value']??'-',
        per90Value: json['per90_value']??'-',
      );
}

class PlayerPerformanceModel extends PlayerPerformanceEntity {
  PlayerPerformanceModel(
      {required super.passing,
      required super.shortPassing,
      required super.longPassing,
      required super.crosses,
      required super.crossOpenPlay,
      required super.crossSetPiece,
      required super.ballReceive,
      required super.attempts,
      required super.dribble});

  factory PlayerPerformanceModel.fromJson(Map<String, dynamic> json) =>
      PlayerPerformanceModel(
        passing: json["passing"] == null
            ? []
            : List<StatisticValueModel>.from(
                json["passing"]!.map((x) => StatisticValueModel.fromJson(x))),
        longPassing: json["long_passing"] == null
            ? []
            : List<StatisticValueModel>.from(json["long_passing"]!
                .map((x) => StatisticValueModel.fromJson(x))),
        shortPassing: json["short_passing"] == null
            ? []
            : List<StatisticValueModel>.from(json["short_passing"]!
                .map((x) => StatisticValueModel.fromJson(x))),
        crosses: json["crosses"] == null
            ? []
            : List<StatisticValueModel>.from(
                json["crosses"]!.map((x) => StatisticValueModel.fromJson(x))),
        crossOpenPlay: json["cross_open_play"] == null
            ? []
            : List<StatisticValueModel>.from(json["cross_open_play"]!
                .map((x) => StatisticValueModel.fromJson(x))),
        crossSetPiece: json["cross_set_piece"] == null
            ? []
            : List<StatisticValueModel>.from(json["cross_set_piece"]!
                .map((x) => StatisticValueModel.fromJson(x))),
        ballReceive: json["ball_receive"] == null
            ? []
            : List<StatisticValueModel>.from(json["ball_receive"]!
                .map((x) => StatisticValueModel.fromJson(x))),
        attempts: json["attempts"] == null
            ? []
            : List<StatisticValueModel>.from(
                json["attempts"]!.map((x) => StatisticValueModel.fromJson(x))),
        dribble: json["dribble"] == null
            ? []
            : List<StatisticValueModel>.from(
                json["dribble"]!.map((x) => StatisticValueModel.fromJson(x))),
      );
}
