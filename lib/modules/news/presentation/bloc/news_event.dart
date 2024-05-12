import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}


class GetNewsDetailsData extends NewsEvent {
  final int articleId;
  final int? playerId;
  final int? teamId;
  GetNewsDetailsData({required this.articleId, this.playerId, this.teamId});
}

class GetNewsData extends NewsEvent {
  GetNewsData();
}

class NewsPagination extends NewsEvent {
  NewsPagination();
}

class GetNewNewsData extends NewsEvent {
  GetNewNewsData();
}

class NewNewsPagination extends NewsEvent {
  NewNewsPagination();
}

class GetExclusiveNewsData extends NewsEvent {
  GetExclusiveNewsData();
}

class ExclusiveNewsPagination extends NewsEvent {
  ExclusiveNewsPagination();
}

class GetHighlightNewsData extends NewsEvent {
  GetHighlightNewsData();
}

class HighlightNewsPagination extends NewsEvent {
  HighlightNewsPagination();
}


class GetInterviewNewsData extends NewsEvent {
  GetInterviewNewsData();
}

class InterviewNewsPagination extends NewsEvent {
  InterviewNewsPagination();
}




