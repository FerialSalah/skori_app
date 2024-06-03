
import 'package:skori/modules/players/domain/entity/player_statistics_entity.dart';

class StatisticValueModel extends StatisticValue{
  StatisticValueModel({
    required super.name,
    required super.value,
    required super.icon,
});
  factory StatisticValueModel.fromJson(Map<String,dynamic> json) => StatisticValueModel(
    name: json['name'],
    value: json['value']??'-',
    icon: json['icon'],
  );
}

class PlayerStatisticsModel{
  PlayerStatisticsModel({
    required this.playerStatistics,
  });
  PlayerStatisticsData playerStatistics;
  factory PlayerStatisticsModel.fromJson(Map<String, dynamic> json) => PlayerStatisticsModel(
    playerStatistics: PlayerStatisticsData.fromJson(json["data"]),
  );
}

class PlayerStatisticsData extends PlayerStatisticsEntity {
  PlayerStatisticsData({
    required super.goalsNumber,
    required super.cards,
    required super.passes,
    required super.attemptsAtGoalNo,
    required super.others,

  });
  factory PlayerStatisticsData.fromJson(Map<String, dynamic> json) => PlayerStatisticsData(
    goalsNumber: json["goals_no"] == null ? [] : List<StatisticValueModel>.from(json["goals_no"]!.map((x) => StatisticValueModel.fromJson(x))),
    cards: json["cards"] == null ? [] : List<StatisticValueModel>.from(json["cards"]!.map((x) => StatisticValueModel.fromJson(x))),
    passes: json["passes"] == null ? [] : List<StatisticValueModel>.from(json["passes"]!.map((x) => StatisticValueModel.fromJson(x))),
    attemptsAtGoalNo: json["attempts_at_goal_no"] == null ? [] : List<StatisticValueModel>.from(json["attempts_at_goal_no"]!.map((x) => StatisticValueModel.fromJson(x))),
    others: json["others"] == null ? [] : List<StatisticValueModel>.from(json["others"]!.map((x) => StatisticValueModel.fromJson(x))),
  );
}





