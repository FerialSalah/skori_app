
import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {

  final int id;
  final String name;
  final String logo;
  final String season;
  final String country;
  final String countryFlag;
  final bool isFollow;
  final bool isFavorites;





  TeamEntity(
   {
     required this.id,
     required this.name,
     required this.logo,
     required this.season,
     required this.country,
     required this.countryFlag,
     required this.isFollow,
     required this.isFavorites,
   });
  @override
  List<Object?> get props => [];

}