import 'package:equatable/equatable.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';

class TransferEntity extends Equatable {
  final PlayerTransferEntity? player;
  final TeamMovedEntity? teamMovedTo;
  final TeamMovedEntity? teamMovedFrom;
  final String? joinDate;
  final dynamic fee;
  TransferEntity(
      { this.player,
       this.teamMovedTo,
       this.teamMovedFrom,
       this.joinDate,
       this.fee});
  @override
  List<Object?> get props => [];
}

class PlayerTransferEntity extends Equatable {
  final int id;
  final String name;
  final String nationalShirtNo;
  final String clubShirtNo;
  final CountryEntity? country;
  final String avatar;
  PlayerTransferEntity(
      {required this.id,
      required this.name,
      required this.nationalShirtNo,
      required this.clubShirtNo,
       this.country,
      required this.avatar});
  @override
  List<Object?> get props => [];
}

class CountryEntity extends Equatable {
  final int id;
  final String name;
  final String code;
  final String key;
  final dynamic isDefault;
  final dynamic currency;
  final String flag;
  CountryEntity(
      {required this.id,
      required this.name,
      required this.code,
      required this.key,
      required this.isDefault,
      required this.currency,
      required this.flag});

  @override
  List<Object?> get props => [];
}

class TeamMovedEntity {
 final int id;
 final String name;
 final String logo;

  TeamMovedEntity({required this.id, required this.name, required this.logo});
}
