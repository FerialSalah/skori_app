import 'package:skori/modules/matches/domain/entity/clean_sheets_no_entity.dart';

class CleanSheetsNoModel extends CleanSheetsNoEntity{

  CleanSheetsNoModel({
    required super.name,
    required super.value
  });

  factory CleanSheetsNoModel.fromJson(Map<String, dynamic> json) => CleanSheetsNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

       CleanSheetsNoValueModel.fromJson(json['value'])

  );

}

class CleanSheetsNoValueModel extends CleanSheetsNoValueEntity{
  CleanSheetsNoValueModel({
    required super.homeCleanSheetsNo,
    required super.awayCleanSheetsNo
  });
  factory CleanSheetsNoValueModel.fromJson(Map<String, dynamic> json) => CleanSheetsNoValueModel(
      homeCleanSheetsNo: json["home_clean_sheets_no"],
      awayCleanSheetsNo:json['away_clean_sheets_no']

  );
}