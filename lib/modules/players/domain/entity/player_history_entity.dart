
import 'package:equatable/equatable.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';


class PlayerHistoryEntity extends Equatable {
  final int id;
  final String? joinDate;
  final String? leftDate;
  final String position;
  final TeamEntity team;
  PlayerHistoryEntity(
      {
        required  this.id,
        required   this.team,
        this.joinDate,
        this.leftDate,
        required this.position
      });
  @override
  List<Object?> get props => [];
}

