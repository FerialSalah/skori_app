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

class GetLeagueNews extends LeaguesEvent{
 final int id;
 GetLeagueNews({required this.id});
}

class LeagueNewsPagination extends LeaguesEvent{
  final int id;
  LeagueNewsPagination({required this.id});
}
class GetLeagueTopScores extends LeaguesEvent{
  final int id;
  GetLeagueTopScores({required this.id});
}
class GetLeagueTopAssists extends LeaguesEvent{
  final int id;
  GetLeagueTopAssists({required this.id});
}
class GetLeagueDiscipline extends LeaguesEvent{
  final int id;
  GetLeagueDiscipline({required this.id});
}

class GetLeaguePerformance extends LeaguesEvent{
  final int id ;
  GetLeaguePerformance({required this.id});
}



