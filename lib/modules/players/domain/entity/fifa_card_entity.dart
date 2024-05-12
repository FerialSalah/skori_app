import 'package:equatable/equatable.dart';

class FifaCardEntity extends Equatable{
  final String playingTime;
  final dynamic goalsNo;
  final String attemptsAtGoalNo;

  FifaCardEntity({
    required this.playingTime,
    required this.goalsNo,
    required this.attemptsAtGoalNo
});
@override
List<Object?> get props => [];
}