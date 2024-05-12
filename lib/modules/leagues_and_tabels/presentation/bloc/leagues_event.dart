import 'package:equatable/equatable.dart';

abstract class LeaguesEvent extends Equatable {
  const LeaguesEvent();

  @override
  List<Object> get props => [];
}


class GetLeaguesData extends LeaguesEvent {
  GetLeaguesData();
}

class LeaguesPagination extends LeaguesEvent {
  LeaguesPagination();
}


class GetTableData extends LeaguesEvent {
   final int id;
  GetTableData({required this.id});
}



