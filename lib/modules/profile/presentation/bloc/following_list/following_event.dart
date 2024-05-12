import 'package:equatable/equatable.dart';

abstract class FollowingEvent extends Equatable {
  const FollowingEvent();

  @override
  List<Object> get props => [];
}


class GetFollowingTeamsData extends FollowingEvent {
  GetFollowingTeamsData();
}

class FollowingTeamsPagination extends FollowingEvent {
  FollowingTeamsPagination();
}

class GetFollowingPlayersData extends FollowingEvent {
  GetFollowingPlayersData();
}

class FollowingPlayersPagination extends FollowingEvent {
  FollowingPlayersPagination();
}

class GetFollowingLeaguesData extends FollowingEvent {
  GetFollowingLeaguesData();
}

class FollowingLeaguesPagination extends FollowingEvent {
  FollowingLeaguesPagination();
}



