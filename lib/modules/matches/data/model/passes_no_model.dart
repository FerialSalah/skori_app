import 'package:skori/modules/matches/domain/entity/assists_no_entity.dart';

import '../../domain/entity/passes_no_entity.dart';

class PassesNoModel extends PassesNoEntity{

  PassesNoModel({
    required super.name,
    required super.value
  });

  factory PassesNoModel.fromJson(Map<String, dynamic> json) => PassesNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      PassesNoValueModel.fromJson(json['value'])

  );

}

class PassesNoValueModel extends PassesNoValueEntity{
  PassesNoValueModel({
    required super.homePassesNo,
    required super.awayPassesNo
  });
  factory PassesNoValueModel.fromJson(Map<String, dynamic> json) => PassesNoValueModel(
      homePassesNo: json["home_passes_no"],
      awayPassesNo:json['away_passes_no']

  );
}