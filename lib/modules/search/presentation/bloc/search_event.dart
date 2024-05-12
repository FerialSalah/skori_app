import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}


class GetSearch extends SearchEvent {
  // String key;
  // GetSearch({required this.key});
}





