import 'package:equatable/equatable.dart';

class LeagueDisciplineEntity extends Equatable {
  final LeagueTeamEntity? team;
  final String matchesNo;
  final String yellowCardsNo;
  final String redCardsNo;
  final String pointsNo;

  LeagueDisciplineEntity(
      {required this.team,
      required this.matchesNo,
      required this.yellowCardsNo,
      required this.redCardsNo,
      required this.pointsNo});
  @override
  List<Object?> get props => [];
}

class LeagueTeamEntity extends Equatable {
  final int id;
  final String name;
  final String logo;

  LeagueTeamEntity({required this.id, required this.name, required this.logo});
  @override
  List<Object?> get props => [];
}
