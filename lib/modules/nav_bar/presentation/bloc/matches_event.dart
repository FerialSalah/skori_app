import 'package:equatable/equatable.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();

  @override
  List<Object> get props => [];
}


class GetMatchesData extends MatchesEvent {
  GetMatchesData();
}

class MatchesPagination extends MatchesEvent {
  MatchesPagination();
}




