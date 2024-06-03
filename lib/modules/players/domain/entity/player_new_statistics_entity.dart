import 'package:equatable/equatable.dart';
import 'package:skori/modules/players/domain/entity/player_statistics_entity.dart';


class StatisticAbsoluteValue extends Equatable{
 final String? name;
final  dynamic absoluteValue;
 final dynamic per90Value;

  StatisticAbsoluteValue({this.name, this.absoluteValue, this.per90Value});

  @override
  List<Object?> get props => [];
}
class PlayerNewStatisticsEntity extends Equatable{

final  List<StatisticValue>? mainStats;
final  PlayerPerformanceEntity? playerPerformance;
final  List<StatisticAbsoluteValue>? defensive;
 final List<StatisticAbsoluteValue>? ballLost;
 final List<StatisticAbsoluteValue>? offensive;
final  List<StatisticAbsoluteValue>? administrative;
 final List<StatisticValue>? featuredStats;

  PlayerNewStatisticsEntity(
      {this.mainStats,
        this.playerPerformance,
        this.defensive,
        this.ballLost,
        this.offensive,
        this.administrative,
        this.featuredStats});
  @override
  List<Object?> get props => [];

}

class PlayerPerformanceEntity {
  List<StatisticValue>? passing;
  List<StatisticValue>? longPassing;
  List<StatisticValue>? shortPassing;
  List<StatisticValue>? crosses;
  List<StatisticValue>? crossOpenPlay;
  List<StatisticValue>? crossSetPiece;
  List<StatisticValue>? dribble;
  List<StatisticValue>? ballReceive;
  List<StatisticValue>? attempts;

  PlayerPerformanceEntity({this.passing,
    this.longPassing,
    this.shortPassing,
    this.crosses,
    this.crossOpenPlay,
    this.crossSetPiece,
    this.dribble,
    this.ballReceive,
    this.attempts});
}