import 'package:equatable/equatable.dart';

import '../../../players/domain/entity/player_statistics_entity.dart';


  // List<Map<String,dynamic>> teamStatisticsData(TeamStatisticsEntity teamStatisticsEntity){
  //  return [
  //    {"Matches number": teamStatisticsEntity.matchesNumber},
  //    { "Goals number": teamStatisticsEntity.goalsNumber},
  //    { "Goals penalty number": teamStatisticsEntity.goalsPenaltyNumber},
  //    { "Goals head number": teamStatisticsEntity.goalsHeadNumber},
  //    {"Own goals number": teamStatisticsEntity.ownGoalsNumber},
  //    { "Assists number": teamStatisticsEntity.assistsNumber},
  //    { "Yellow cards number": teamStatisticsEntity.yellowCardsNumber},
  //    { "Red_cards number": teamStatisticsEntity.redCardsNumber},
  //    { "Attempts on goal number": teamStatisticsEntity.attemptsOnGoalNumber},
  //    {"Attempts on goal on target number": teamStatisticsEntity.attemptsOnGoalOnTargetNumber},
  //    {"Attempts on goal inside penalty area number": teamStatisticsEntity.attemptsOnGoalInsidePenaltyAreaNumber},
  //    {"Attempts on goal outside penalty area number": teamStatisticsEntity.attemptsOnGoalOutsidePenaltyAreaNumber},
  //    { "Short passes number": teamStatisticsEntity.shortPassesNumber},
  //    {"Short passes completed number": teamStatisticsEntity.shortPassesCompletedNumber},
  //    {"Passes number": teamStatisticsEntity.passesNumber},
  //    {"Passes completed number": teamStatisticsEntity.passesCompletedNumber},
  //    {"Long passes number": teamStatisticsEntity.longPassesNumber},
  //    {"Long passes completed number": teamStatisticsEntity.longPassesCompletedNumber},
  //    {"Crosses number": teamStatisticsEntity.crossesNumber},
  //    {"Crosses completed number": teamStatisticsEntity.crossesCompletedNumber},
  //    {"Corners number": teamStatisticsEntity.cornersNumber},
  //    {"Offsides number": teamStatisticsEntity.offsidesNumber},
  //    {"Fouls committed number": teamStatisticsEntity.foulsCommittedNumber},
  //    {"Fouls awarded number": teamStatisticsEntity.foulsAwardedNumber},
  //    { "Line breaks attempted number": teamStatisticsEntity.lineBreaksAttemptedNumber},
  //    {"Line breaks attempted completed number": teamStatisticsEntity.lineBreaksAttemptedCompletedNumber},
  //    {"Free kicks number": teamStatisticsEntity.freeKicksNumber},
  //
  //
  //  ];
  // }


class TeamStatisticsEntity extends Equatable {

  final List<StatisticValue> matchesNumber;
  final List<StatisticValue> goalsNumber;
  final List<StatisticValue> cards;
  final List<StatisticValue> attemptsAtGoalNo;
  final List<StatisticValue> passes;
  final List<StatisticValue> others;

  TeamStatisticsEntity({
    required this.matchesNumber,
    required this.goalsNumber,
    required this.cards,
    required this.attemptsAtGoalNo,
    required this.passes,
    required this.others,

      });
  @override
  List<Object?> get props => [];

}