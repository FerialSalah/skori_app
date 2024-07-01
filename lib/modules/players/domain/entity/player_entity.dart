
import 'package:equatable/equatable.dart';

import '../../../teams/domain/entity/team_entity.dart';
import 'fifa_card_entity.dart';


class PlayerEntity extends Equatable {

  final int id;
  final String name;
  final String avatar;
  final String birthDate;
  final dynamic age;
  final String gender;
  final String weight;
  final String height;
  final String nationalShirtNumber;
  final String clubShirtNumber;
  final String countryName;
  final String countryLogo;
  final TeamEntity? teamEntity;
  final String position;
  final bool isFollow;
  final bool isFavourite;
final FifaCardEntity fifaCardEntity;



  PlayerEntity(
   {
     required this.id,
     required this.name,
     required this.avatar,
     required this.birthDate,
     required this.gender,
     required this.age,
     required this.weight,
     required this.height,
     required this.countryLogo,
     required this.countryName,
     required this.nationalShirtNumber,
     required this.clubShirtNumber,
     required this.teamEntity,
     required this.position,
     required this.isFollow,
     required this.isFavourite,
     required this.fifaCardEntity

   });
  @override
  List<Object?> get props => [];

}

