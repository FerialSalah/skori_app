import 'package:equatable/equatable.dart';

abstract class RecentMatchesEvent extends Equatable {
  const RecentMatchesEvent();

  @override
  List<Object> get props => [];
}


class GetPreviousMatchesData extends RecentMatchesEvent {
  int homeTeamId;
  int awayTeamId;
  int matchId;
  GetPreviousMatchesData({required this.homeTeamId,required this.awayTeamId,required this.matchId});
}
class GetRecentHomeMatchesData extends RecentMatchesEvent {
  int teamId;
  int matchId;
  GetRecentHomeMatchesData({required this.teamId,required this.matchId});

}

class GetRecentAwayMatchesData extends RecentMatchesEvent {
  int teamId;
  int matchId;
  GetRecentAwayMatchesData({required this.teamId,required this.matchId});

}





