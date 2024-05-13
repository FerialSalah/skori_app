import 'package:equatable/equatable.dart';

class FifaCardEntity extends Equatable{
  final dynamic playingTime;
  final dynamic goalsNo;
  final dynamic attemptsAtGoalNo;

  FifaCardEntity({
    required this.playingTime,
    required this.goalsNo,
    required this.attemptsAtGoalNo
});
@override
List<Object?> get props => [];
}