import 'package:skori/modules/matches/domain/entity/long_pass_no_entity.dart';

class LongPassesNoModel extends LongPassNoEntity{
  LongPassesNoModel({
    required super.name,
    required super.value
  });

  factory LongPassesNoModel.fromJson(Map<String, dynamic> json) => LongPassesNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

  LongPassNoValueModel.fromJson(json['value'])

  );

}

class LongPassNoValueModel extends LongPassNoValueEntity{
  LongPassNoValueModel({
    required super.awayLongPassesNo,
    required super.homeLongPassesNo
  });
  factory LongPassNoValueModel.fromJson(Map<String, dynamic> json) => LongPassNoValueModel(
      awayLongPassesNo: json["away_long_passes_no"],
      homeLongPassesNo:json['home_long_passes_no']

  );
}