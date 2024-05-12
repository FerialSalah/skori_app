import 'package:skori/modules/matches/domain/entity/committed_fouls_no_entity.dart';

class CommittedFoulsNoModel extends CommittedFoulsNoEntity{
  CommittedFoulsNoModel({
    required super.name,
    required super.value
  });

  factory CommittedFoulsNoModel.fromJson(Map<String, dynamic> json) => CommittedFoulsNoModel(
      name: json["name"],
           value:json['value'].toString()=="premium"||json['value']==null?json['value']:

  CommittedFoulsNoValueModel.fromJson(json['value'])

  );

}

class CommittedFoulsNoValueModel extends CommittedFoulsNoValueEntity{
  CommittedFoulsNoValueModel({
    required super.homeCommittedFoulsNo,
    required super.awayCommittedFoulsNo
  });
  factory CommittedFoulsNoValueModel.fromJson(Map<String, dynamic> json) => CommittedFoulsNoValueModel(
      homeCommittedFoulsNo: json["home_committed_fouls_no"],
      awayCommittedFoulsNo:json['away_committed_fouls_no']

  );
}