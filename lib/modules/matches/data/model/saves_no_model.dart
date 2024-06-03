import 'package:skori/modules/matches/domain/entity/saves_no_entity.dart';

class SavesNoModel extends SavesNoEntity{

  SavesNoModel({
    required super.name,
    required super.value
  });

  factory SavesNoModel.fromJson(Map<String, dynamic> json) => SavesNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

       SavesNoValueModel.fromJson(json['value'])

  );

}

class SavesNoValueModel extends SavesNoValueEntity{
  SavesNoValueModel({
    required super.homeSavesNo,
    required super.awaySavesNo
  });
  factory SavesNoValueModel.fromJson(Map<String, dynamic> json) => SavesNoValueModel(
      homeSavesNo: json["home_saves_no"],
      awaySavesNo:json['away_saves_no']

  );
}