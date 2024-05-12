import 'package:skori/modules/matches/domain/entity/clean_sheets_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/yellow_card_no_entity.dart';

class YellowCardsNoModel extends YellowCardsNoEntity{

  YellowCardsNoModel({
    required super.name,
    required super.value
  });

  factory YellowCardsNoModel.fromJson(Map<String, dynamic> json) => YellowCardsNoModel(
      name: json["name"],

          value:json['value'].toString()=="premium"||json['value']==null?json['value']:

  YellowCardsNoValueModel.fromJson(json['value'])

  );

}

class YellowCardsNoValueModel extends YellowCardsNoValueEntity{
  YellowCardsNoValueModel({
    required super.homeYellowCardsNo,
    required super.awayYellowCardsNo
  });
  factory YellowCardsNoValueModel.fromJson(Map<String, dynamic> json) => YellowCardsNoValueModel(
      homeYellowCardsNo: json["home_yellow_cards_no"],
      awayYellowCardsNo:json['away_yellow_cards_no']

  );
}