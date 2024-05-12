import 'package:equatable/equatable.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object> get props => [];
}


class GetTeamsData extends TeamEvent {
  GetTeamsData();
}

class TeamsPagination extends TeamEvent {
  TeamsPagination();
}
class GetFilterTeamsData extends TeamEvent {
  GetFilterTeamsData();
}

class GetTeamMatches extends TeamEvent {
  int id;
  GetTeamMatches({required this.id});
}


class GetTeamStatistics extends TeamEvent {
  int id;
  GetTeamStatistics({required this.id});
}

class GetTeamNews extends TeamEvent {
  int id;
  GetTeamNews({required this.id});
}
class GetTeamPlayers extends TeamEvent {
  int id;
  GetTeamPlayers({required this.id});
}
class TeamPlayersPagination extends TeamEvent{
  int id;
    TeamPlayersPagination({  required this.id});
}