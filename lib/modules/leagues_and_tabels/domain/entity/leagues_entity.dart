
import 'package:equatable/equatable.dart';


class LeagueEntity extends Equatable {

  final int id;
  final String title;
  final String logo;
  final String continent;
  final bool isFollow;
  final bool isFavorite;






  LeagueEntity(
   {
     required this.id,
     required this.title,
     required this.logo,
     required this.continent,
     required this.isFollow,
     required this.isFavorite,


   });
  @override
  List<Object?> get props => [];

}