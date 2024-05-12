
import '../../domain/entity/crosses_no_entity.dart';

class CrossesNoModel extends CrossesNoEntity{
  CrossesNoModel({
    required super.name,
    required super.value
  });

  factory CrossesNoModel.fromJson(Map<String, dynamic> json) => CrossesNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      CrossesNoValueModel.fromJson(json['value'])

  );

}

class CrossesNoValueModel extends CrossesNoValueEntity{
  CrossesNoValueModel({
    required super.homeCrossesNo,
    required super.awayCrossesNo
  });
  factory CrossesNoValueModel.fromJson(Map<String, dynamic> json) => CrossesNoValueModel(
      homeCrossesNo: json["home_crosses_no"],
      awayCrossesNo:json['away_crosses_no']

  );
}