import 'package:skori/modules/players/domain/entity/fifa_card_entity.dart';

class FifaCardModel extends FifaCardEntity{
  FifaCardModel({required super.playingTime, required super.goalsNo, required super.attemptsAtGoalNo});


  factory FifaCardModel.fromJson(Map<String, dynamic> json) => FifaCardModel(
     playingTime:  json["playing_time"],
    goalsNo: json['goals_no'],
    attemptsAtGoalNo: json['attempts_at_goal_no']

  );
}