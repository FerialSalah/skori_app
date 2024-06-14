import 'package:equatable/equatable.dart';

class LeagueTopEntity extends Equatable {
  final String? teamId;
  final String? playerId;
  final String? totalGoals;
  final String? totalAssists;
  final String? totalMatches;
  final LeaguePlayerEntity? player;
  final LeagueTeamEntity? team;

  LeagueTopEntity(
      {required this.teamId,
      required this.totalGoals,
      required this.playerId,
        this.totalAssists,
      this.player,
      this.totalMatches,
      this.team});
  @override
  List<Object?> get props => [];
}

class LeaguePlayerEntity extends Equatable {
  final int? id;
  final String? name;
  final String? nationalShirtNo;
  final String? clubShirtNo;
  final Country? country;
  final String? avatar;

  LeaguePlayerEntity(
      {required this.id,
      this.name,
      this.nationalShirtNo,
      this.clubShirtNo,
      this.country,
      this.avatar});
  @override
  List<Object?> get props => [];
}

class Country {
  int? id;
  String? name;
  String? code;
  String? key;
  Null isDefault;
  String? currency;
  String? flag;

  Country(
      {this.id,
      this.name,
      this.code,
      this.key,
      this.isDefault,
      this.currency,
      this.flag});
}

class LeagueTeamEntity extends Equatable {
  final int? id;
  final String? name;
  final String? logo;

  LeagueTeamEntity({this.id, this.name, this.logo});
  @override
  List<Object?> get props => [];
}
