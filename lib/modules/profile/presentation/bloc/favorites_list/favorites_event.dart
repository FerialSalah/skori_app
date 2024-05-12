import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}


class GetFavoritesTeamsData extends FavoritesEvent {
  GetFavoritesTeamsData();
}

class FavoritesTeamsPagination extends FavoritesEvent {
  FavoritesTeamsPagination();
}

class GetFavoritesPlayersData extends FavoritesEvent {
  GetFavoritesPlayersData();
}

class FavoritesPlayersPagination extends FavoritesEvent {
  FavoritesPlayersPagination();
}

class GetFavoritesNewsData extends FavoritesEvent {
  GetFavoritesNewsData();
}

class FavoritesNewsPagination extends FavoritesEvent {
  FavoritesNewsPagination();
}

class GetFavoritesLeaguesData extends FavoritesEvent {
  GetFavoritesLeaguesData();
}

class FavoritesLeaguesPagination extends FavoritesEvent {
  FavoritesLeaguesPagination();
}



