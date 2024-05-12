import 'package:skori/modules/matches/domain/entity/crosses_open_play_no_entity.dart';

class CrossesOpenPlayNoModel extends CrossesOpenPlayNoEntity{
  CrossesOpenPlayNoModel({
    required super.name,
    required super.value
  });

  factory CrossesOpenPlayNoModel.fromJson(Map<String, dynamic> json) => CrossesOpenPlayNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      CrossesOpenPlayNoValueModel.fromJson(json['value'])

  );

}

class CrossesOpenPlayNoValueModel extends CrossesOpenPlayNoValueEntity{
  CrossesOpenPlayNoValueModel({
    required super.homeCrossesOpenPlayNo,
    required super.awayCrossesOpenPlayNo
  });
  factory CrossesOpenPlayNoValueModel.fromJson(Map<String, dynamic> json) => CrossesOpenPlayNoValueModel(
      homeCrossesOpenPlayNo: json["home_crosses_open_play_no"],
      awayCrossesOpenPlayNo:json['away_crosses_open_play_no']

  );
}