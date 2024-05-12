
import 'package:equatable/equatable.dart';


class TableEntity extends Equatable {

  final int id;
  final String name;
  final String logo;
  final int matchesNum;
  final int points;
  final int win;
  final int lose;
  final int draw;
  final int scoreGoal;
  final int  reverseGoal;
  final int  differentGoal;
  final String  countryName;
  final String  countryFlag;
  final bool  isFollow;
  final bool  isFavorite;






  TableEntity(
      {
        required this.id,
        required this.name,
        required this.logo,
        required this.matchesNum,
        required this.points,
        required this.win,
        required this.lose,
        required this.draw,
        required this.scoreGoal,
        required this.reverseGoal,
        required this.differentGoal,
        required this.countryName,
        required this.countryFlag,
        required this.isFollow,
        required this.isFavorite,


      });
  @override
  List<Object?> get props => [];

}