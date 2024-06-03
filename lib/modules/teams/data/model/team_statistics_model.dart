

import '../../../players/data/model/player_statistics_model.dart';
import '../../domain/entity/team_statistics_entity.dart';

class TeamStatisticsModel{
  TeamStatisticsModel({
    required this.teamStatistics,
  });
  TeamStatisticsData teamStatistics;
  factory TeamStatisticsModel.fromJson(Map<String, dynamic> json) => TeamStatisticsModel(
    teamStatistics: TeamStatisticsData.fromJson(json["data"]),
  );
}
class TeamStatisticsData extends TeamStatisticsEntity {
  TeamStatisticsData({
    required super.matchesNumber,
    required super.goalsNumber,
    required super.cards,
    required super.passes,
    required super.attemptsAtGoalNo,
    required super.others,

  });
  factory TeamStatisticsData.fromJson(Map<String, dynamic> json) => TeamStatisticsData(
    matchesNumber: json["matches_no"] == null ? [] : List<StatisticValueModel>.from(json["matches_no"]!.map((x) => StatisticValueModel.fromJson(x))),
    goalsNumber: json["goals_no"] == null ? [] : List<StatisticValueModel>.from(json["goals_no"]!.map((x) => StatisticValueModel.fromJson(x))),
    cards: json["cards"] == null ? [] : List<StatisticValueModel>.from(json["cards"]!.map((x) => StatisticValueModel.fromJson(x))),
    passes: json["passes"] == null ? [] : List<StatisticValueModel>.from(json["passes"]!.map((x) => StatisticValueModel.fromJson(x))),
    attemptsAtGoalNo: json["attempts_at_goal_no"] == null ? [] : List<StatisticValueModel>.from(json["attempts_at_goal_no"]!.map((x) => StatisticValueModel.fromJson(x))),
    others: json["others"] == null ? [] : List<StatisticValueModel>.from(json["others"]!.map((x) => StatisticValueModel.fromJson(x))),
  );
}





