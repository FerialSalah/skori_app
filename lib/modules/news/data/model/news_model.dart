import 'package:skori/modules/news/domain/entity/news_entity.dart';

class AllNewsModel {
  AllNewsModel({
    required this.data,
  });

  List<NewsModel> data;

  factory AllNewsModel.fromJson(Map<String, dynamic> json) => AllNewsModel(
        data: json["data"] == null
            ? []
            : List<NewsModel>.from(
                json["data"]!.map((x) => NewsModel.fromJson(x))),
      );
}

class NewsModel extends NewsEntity {
  NewsModel(
      {required super.id,
      required super.title,
      required super.body,
      required super.writerName,
      required super.cover,
      required super.date,
      required super.playerName,
      required super.playerId,
      required super.teamName,
      required super.teamId,
      required super.teamLogo,
      required super.leagueName,
      required super.leagueId,
      required super.leagueLogo,
      required super.commentsCount,
      required super.isActive,
      required super.isFavorite,
      required super.isFeatured,
      required super.isPaid,
      required super.isProminent,
      required super.type, required super.localedType});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      writerName: json["writer_name"],
      cover: json["article_cover"],
      date: json["date"],
      teamId: json["team_id"] ?? 0,
      teamName: json["team_name"],
      teamLogo: json["team_logo"],
      playerId: json["player_id"] ?? 0,
      playerName: json["player_name"],
      leagueId: json["tournament_id"] ?? 0,
      leagueName: json["tournament_name"],
      leagueLogo: json["tournament_logo"],
      commentsCount: json['comments_count'],
      isFeatured: json['is_featured'],
      isProminent: json['is_prominent'],
      type: json['type'],
      localedType: json['localed_type'],
      isFavorite: json['is_favorite'],
      isPaid: json['is_paid'],
      isActive: json['is_active']);
}
