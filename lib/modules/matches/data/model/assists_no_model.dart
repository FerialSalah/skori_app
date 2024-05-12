import 'package:skori/modules/matches/domain/entity/assists_no_entity.dart';

class AssistsNoModel extends AssistsNoEntity{

  AssistsNoModel({
    required super.name,
    required super.value
  });

  factory AssistsNoModel.fromJson(Map<String, dynamic> json) => AssistsNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

  AssistsNoValueModel.fromJson(json['value'])

  );

}

class AssistsNoValueModel extends AssistsNoValueEntity{
  AssistsNoValueModel({
    required super.homeAssistsNo,
    required super.awayAssistsNo
  });
  factory AssistsNoValueModel.fromJson(Map<String, dynamic> json) => AssistsNoValueModel(
      homeAssistsNo: json["home_assists_no"],
      awayAssistsNo:json['away_assists_no']

  );
}