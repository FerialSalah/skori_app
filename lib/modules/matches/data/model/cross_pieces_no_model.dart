import 'package:skori/modules/matches/domain/entity/cross_set_pieces_no_entity.dart';

class CrossSetPiecesNoModel extends CrossSetPiecesNoEntity{
  CrossSetPiecesNoModel({
    required super.name,
    required super.value
  });

  factory CrossSetPiecesNoModel.fromJson(Map<String, dynamic> json) => CrossSetPiecesNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      CrossSetPiecesValueModel.fromJson(json['value'])

  );

}

class CrossSetPiecesValueModel extends CrossSetPiecesValueEntity{
  CrossSetPiecesValueModel({
    required super.homeCrossSetPiecesNo,
    required super.awayCrossSetPiecesNo
  });
  factory CrossSetPiecesValueModel.fromJson(Map<String, dynamic> json) => CrossSetPiecesValueModel(
      awayCrossSetPiecesNo: json["away_cross_set_peices_no"],
      homeCrossSetPiecesNo:json['home_cross_set_peices_no']

  );
}