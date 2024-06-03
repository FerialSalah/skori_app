import 'package:skori/modules/matches/domain/entity/planties_missed_no_entity.dart';

class PenaltiesMissedNoModel extends PenaltiesMissedNoEntity{

  PenaltiesMissedNoModel({
    required super.name,
    required super.value
  });

  factory PenaltiesMissedNoModel.fromJson(Map<String, dynamic> json) => PenaltiesMissedNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      PenaltiesMissedNoValueModel.fromJson(json['value'])

  );

}

class PenaltiesMissedNoValueModel extends PenaltiesMissedNoValueEntity{
  PenaltiesMissedNoValueModel({
    required super.homePenaltiesMissedNo,
    required super.awayPenaltiesMissedNo
  });
  factory PenaltiesMissedNoValueModel.fromJson(Map<String, dynamic> json) => PenaltiesMissedNoValueModel(
      homePenaltiesMissedNo: json["home_penalties_missed_no"],
      awayPenaltiesMissedNo:json['away_penalties_missed_no']

  );
}