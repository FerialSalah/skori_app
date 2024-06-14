import 'package:equatable/equatable.dart';

class LeaguePerformanceEntity extends Equatable{
 final  int id;
final  String tournamentLogo;
 final String round;
 final String type;
final  String season;
final  int? homeTeamId;
 final String? homeTeamName;
final  String? homeTeamLogo;
 final int? awayTeamId;
 final String? awayTeamName;
 final String? awayTeamLogo;
final  String? homeTeamScore;
 final String? awayTeamScore;
final  int? totalScores;
final  String? stadium;
 final String? date;
 final String? time;
 final String? watchLink;
final  String? currentTime;

 LeaguePerformanceEntity(
     { required this.id,
       required this.tournamentLogo,
       required  this.round,
       required  this.type,
       required this.season,
       required this.homeTeamId,
       required  this.homeTeamName,
       required this.homeTeamLogo,
       required  this.awayTeamId,
       required  this.awayTeamName,
       required this.awayTeamLogo,
       required this.homeTeamScore,
       required  this.awayTeamScore,
       required this.totalScores,
       required this.stadium,
       required this.date,
       required this.time,
       required this.watchLink,
       required this.currentTime});
  @override
  List<Object?> get props => [];
}