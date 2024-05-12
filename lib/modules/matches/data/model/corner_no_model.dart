import 'package:skori/modules/matches/domain/entity/clean_sheets_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/corner_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/yellow_card_no_entity.dart';

class CornerNoModel extends CornerNoEntity{

  CornerNoModel({
    required super.name,
    required super.value
  });

  factory CornerNoModel.fromJson(Map<String, dynamic> json) => CornerNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:
      CornerNoValueModel.fromJson(json['value'])

  );

}

class CornerNoValueModel extends CornerNoValueEntity{
  CornerNoValueModel({
    required super.homeCornerNo,
    required super.awayCornerNo
  });
  factory CornerNoValueModel.fromJson(Map<String, dynamic> json) => CornerNoValueModel(
      homeCornerNo: json["home_corner_no"],
      awayCornerNo:json['away_corner_no']

  );
}