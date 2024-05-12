import 'package:equatable/equatable.dart';

  //
  // List<Map<String,dynamic>> playerStatisticsData(PlayerStatisticsEntity playerStatisticsEntity){
  //  return [
  //    { "Goals number": playerStatisticsEntity.goalsNumber},
  //    { "Goals penalty number": playerStatisticsEntity.goalsPenaltyNumber},
  //    { "Goals head number": playerStatisticsEntity.goalsHeadNumber},
  //    { "Own Goals number": playerStatisticsEntity.ownGoalNumber},
  //    { "Assists number": playerStatisticsEntity.assistsNumber},
  //    { "Yellow cards number": playerStatisticsEntity.yellowCardsNumber},
  //    { "Red_cards number": playerStatisticsEntity.redCardsNumber},
  //    { "Attempts on goal number": playerStatisticsEntity.attemptsOnGoalNumber},
  //    {"Attempts on goal on target number": playerStatisticsEntity.attemptsOnGoalOnTargetNumber},
  //    { "Short passes number": playerStatisticsEntity.shortPassesNumber},
  //    {"Short passes completed number": playerStatisticsEntity.shortPassesCompletedNumber},
  //    {"Passes number": playerStatisticsEntity.passesNumber},
  //    {"Passes completed number": playerStatisticsEntity.passesCompletedNumber},
  //    {"Long passes number": playerStatisticsEntity.longPassesNumber},
  //    {"Long passes completed number": playerStatisticsEntity.longPassesCompletedNumber},
  //    {"Crosses number": playerStatisticsEntity.crossesNumber},
  //    {"Crosses completed number": playerStatisticsEntity.crossesCompletedNumber},
  //    {"Corners number": playerStatisticsEntity.cornersNumber},
  //    {"Offsides number": playerStatisticsEntity.offsidesNumber},
  //    {"Fouls committed number": playerStatisticsEntity.foulsCommittedNumber},
  //    {"Fouls awarded number": playerStatisticsEntity.foulsAwardedNumber}
  //  ];
  // }

class StatisticValue extends Equatable{
    final String name;
    final dynamic value;
    final String? icon;

    StatisticValue({required this.name, required this.value,this.icon});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PlayerStatisticsEntity extends Equatable {

  final List<StatisticValue> goalsNumber;
  final List<StatisticValue> cards;
  final List<StatisticValue> attemptsAtGoalNo;
  final List<StatisticValue> passes;
  final List<StatisticValue> others;


  PlayerStatisticsEntity({
    required this.goalsNumber,
    required this.cards,
    required this.attemptsAtGoalNo,
    required this.passes,
    required this.others,

      });
  @override
  List<Object?> get props => [];

}