import 'package:equatable/equatable.dart';

abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  List<Object> get props => [];
}


class GetPlayersData extends PlayersEvent {
  GetPlayersData();
}

class PlayersPagination extends PlayersEvent {
  PlayersPagination();
}

class GetPlayerInfo extends PlayersEvent {
  final int id;

  GetPlayerInfo({required this.id});

}

class GetPlayerStatistics extends PlayersEvent {
  final int id;

  GetPlayerStatistics({required this.id});

}
class GetPlayerNewStatistics extends PlayersEvent {
  final int id;

  GetPlayerNewStatistics({required this.id});

}

class GetPlayerHistory extends PlayersEvent {
  final int id;

  GetPlayerHistory({required this.id});

}


class GetPlayerNews extends PlayersEvent {
  final int id;

  GetPlayerNews({required this.id});

}





