import 'package:equatable/equatable.dart';

class FifaCardEntity extends Equatable{
  final FifaCardValueEntity? playingTime;
  final FifaCardValueEntity? win;
  final FifaCardValueEntity? attemptsSaved;
  final FifaCardValueEntity? passes;

  FifaCardEntity({
    required this.playingTime,
    required this.win,
    required this.attemptsSaved,
    required this.passes
});
@override
List<Object?> get props => [];
}

class FifaCardValueEntity extends Equatable{
final  String? title;
 final dynamic value;
  FifaCardValueEntity({this.title, this.value});
  @override
  List<Object?> get props => [];
}


