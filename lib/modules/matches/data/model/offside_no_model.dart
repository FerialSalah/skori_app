import 'package:skori/modules/matches/domain/entity/offside_no_entity.dart';

class OffsideNoModel extends OffsideNoEntity{

  OffsideNoModel({
    required super.name,
    required super.value
  });

  factory OffsideNoModel.fromJson(Map<String, dynamic> json) => OffsideNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      OffsideNoValueModel.fromJson(json['value'])

  );

}

class OffsideNoValueModel extends OffsideNoValueEntity{
  OffsideNoValueModel({
    required super.homeOffsideNo,
    required super.awayOffsideNo
  });
  factory OffsideNoValueModel.fromJson(Map<String, dynamic> json) => OffsideNoValueModel(
      homeOffsideNo: json["home_offside_no"],
      awayOffsideNo:json['away_offside_no']

  );
}