import 'dart:convert';
import 'package:skori/modules/teams/data/model/team_model.dart';
import '../../domain/entity/player_history_entity.dart';

PlayerHistoryModel playerInfoModelFromJson(String str) => PlayerHistoryModel.fromJson(json.decode(str));

class PlayerHistoryModel {
  List<PlayerHistoryData> playerHistoryData;

  PlayerHistoryModel({
    required this.playerHistoryData,
  });

  factory PlayerHistoryModel.fromJson(Map<String, dynamic> json) => PlayerHistoryModel(
    playerHistoryData: List<PlayerHistoryData>.from(json["data"].map((x) => PlayerHistoryData.fromJson(x))),
  );
}

class PlayerHistoryData extends PlayerHistoryEntity {
  PlayerHistoryData({
    required super.id,
    super.joinDate,
    super.leftDate,
    required super.position,
    required  super.team
  });

  factory PlayerHistoryData.fromJson(Map<String, dynamic> json) => PlayerHistoryData(
    id: json["id"],
    joinDate: json["join_date"],
    leftDate: json["left_date"],
    position: json["position"],
    team: TeamModel.fromJson(json["team"]),
  );
}

