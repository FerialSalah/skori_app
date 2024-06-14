import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';

class TransfersModel {
  TransfersModel({
    required this.data,
  });

  List<TransferModel> data;

  factory TransfersModel.fromJson(Map<String, dynamic> json) => TransfersModel(
        data: json["data"] == null
            ? []
            : List<TransferModel>.from(
                json["data"]!.map((x) => TransferModel.fromJson(x))),
      );
}

class TransferModel extends TransferEntity {
  TransferModel(
      {super.player,
      super.joinDate,
      super.teamMovedTo,
      super.teamMovedFrom,
      super.fee});
  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
      player:json['player']==null?null: PlayerTransferModel.fromJson(json["player"]),
      joinDate: json["join_date"],
      teamMovedTo:json['team_moved_to']==null?null: TeamMovedModel.fromJson(json['team_moved_to']),
      teamMovedFrom:json['team_moved_from']==null?null: TeamMovedModel.fromJson(json['team_moved_from']),
      fee: json["fee"]);
}

class PlayerTransferModel extends PlayerTransferEntity {
  PlayerTransferModel(
      {required super.avatar,
      required super.clubShirtNo,
      required super.id,
      required super.name,
      required super.nationalShirtNo,
      super.country});

  factory PlayerTransferModel.fromJson(Map<String, dynamic> json) =>
      PlayerTransferModel(
        id: json['id'],
        avatar: json["avatar"],
        clubShirtNo: json['club_shirt_no'],
        name: json['name'],
        nationalShirtNo: json['national_shirt_no'],
        country:json['country']==null?null: CountryModel.fromJson(json['country']),
      );
}

class CountryModel extends CountryEntity {
  CountryModel(
      {required super.id,
      required super.code,
      required super.currency,
      required super.flag,
      required super.isDefault,
      required super.key,
      required super.name});
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      id: json['id'],
      code: json["code"] ?? "",
      currency: json['currency']??"",
      flag: json['flag'] ?? "",
      isDefault: json['is_default'] ,
      key: json['key'] ?? "",
      name: json['name'] ?? "");
}

class TeamMovedModel extends TeamMovedEntity {
  TeamMovedModel({required super.id, required super.logo, required super.name});
  factory TeamMovedModel.fromJson(Map<String, dynamic> json) =>
      TeamMovedModel(id: json["id"], logo: json["logo"], name: json["name"]);
}
