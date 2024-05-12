import 'package:equatable/equatable.dart';

abstract class MatchStatisticsEvent extends Equatable {
  const MatchStatisticsEvent();

  @override
  List<Object> get props => [];
}


class GetMatchStatisticsData extends MatchStatisticsEvent {
 int matchId;
  GetMatchStatisticsData({required this.matchId});
}






