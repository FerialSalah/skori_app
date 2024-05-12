import 'package:equatable/equatable.dart';

class MatchEntity extends Equatable {
  final int id;
  final String homeTeamScore;
  final String awayTeamScore;
  final String stadium;
  final String logo;
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamLogo;
  final String awayTeamLogo;
  final String time;
  final String currentTime;
  final String date;
  final String tournamentLogo;
  final String round;
  final String type;
  final String season;
  final int homeTeamId;
  final int awayTeamId;
  final String watchLink;

  MatchEntity({
    required this.tournamentLogo,
    required this.round,
    required this.type,
    required this.season,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.watchLink,
    required this.id,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.stadium,
    required this.logo,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.time,
    required this.currentTime,
    required this.date,
  });
  @override
  List<Object?> get props => [];
}
