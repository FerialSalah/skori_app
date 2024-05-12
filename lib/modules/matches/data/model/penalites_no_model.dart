import 'package:skori/modules/matches/domain/entity/planties_no_entity.dart';

class PenaltiesNoModel extends PenaltiesNoEntity{

  PenaltiesNoModel({
    required super.name,
    required super.value
  });

  factory PenaltiesNoModel.fromJson(Map<String, dynamic> json) => PenaltiesNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

       PenaltiesNoValueModel.fromJson(json['value'])

  );

}

class PenaltiesNoValueModel extends PenaltiesNoValueEntity{
  PenaltiesNoValueModel({
    required super.homePenaltiesNo,
    required super.awayPenaltiesNo
  });
  factory PenaltiesNoValueModel.fromJson(Map<String, dynamic> json) => PenaltiesNoValueModel(
      homePenaltiesNo: json["home_penalties_no"],
      awayPenaltiesNo:json['away_penalties_no']

  );
}