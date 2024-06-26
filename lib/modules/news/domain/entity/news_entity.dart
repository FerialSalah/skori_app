import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int id;
  final String title;
  final String body;
  final String writerName;
  final String cover;
  final String date;
  final String? teamName;
  final int teamId;
  final String teamLogo;
  final String? playerName;
  final int playerId;
  final String? leagueName;
  final int leagueId;
  final String leagueLogo;
  final dynamic commentsCount;
  final bool? isFeatured;
  final bool? isProminent;
  final String? type;
  final String? localedType;
  final bool? isFavorite;
  final String? isPaid;
  final String? isActive;

  NewsEntity(
  {
   required this.localedType,
    required this.id,
    required this.title,
    required this.body,
    required this.writerName,
    required this.cover,
    required this.date,
    required this.teamId,
    this.teamName,
    required this.teamLogo,
    required this.playerId,
    this.playerName,
    required this.leagueId,
    this.leagueName,
    required this.leagueLogo,
    this.commentsCount,
    this.isFeatured,
    this.isProminent,
    this.type,
    this.isFavorite,
    this.isPaid,
    this.isActive
  });
  @override
  List<Object?> get props => [];
}
