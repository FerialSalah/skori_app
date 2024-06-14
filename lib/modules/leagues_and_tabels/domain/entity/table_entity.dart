import 'package:equatable/equatable.dart';

class LeagueStageEntity extends Equatable {
  final  int? id;
  final String? title;
  final List<TableEntity>? ranks;

  LeagueStageEntity({required this.id,required this.title,required this.ranks});
  @override
  List<Object?> get props => [];
}

class TableEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? logo;
  final String? teamCover;
  final String? matchesNo;
  final String? winMatchesNo;
  final String? loseMatchesNo;
  final String? drawMatchesNo;
  final String? scoreGoalsNo;
  final String? reverseGoalsNo;
  final String? differentGoalsNo;
  final String? pointsNo;

  TableEntity({
    required this.id,
    required this.name,
    required this.logo,
    this.teamCover,
    this.matchesNo,
    this.winMatchesNo,
    this.loseMatchesNo,
    this.drawMatchesNo,
    this.scoreGoalsNo,
    this.reverseGoalsNo,
    this.differentGoalsNo,
    this.pointsNo,
    this.description
  });
  @override
  List<Object?> get props => [];
}
