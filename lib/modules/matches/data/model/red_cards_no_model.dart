import 'package:skori/modules/matches/domain/entity/clean_sheets_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/red_cards_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/yellow_card_no_entity.dart';

class RedCardsNoModel extends RedCardsNoEntity{

  RedCardsNoModel({
    required super.name,
    required super.value
  });

  factory RedCardsNoModel.fromJson(Map<String, dynamic> json) => RedCardsNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:
      RedCardsNoValueModel.fromJson(json['value'])

  );

}

class RedCardsNoValueModel extends RedCardsNoValueEntity{
  RedCardsNoValueModel({
    required super.homeRedCardsNo,
    required super.awayRedCardsNo
  });
  factory RedCardsNoValueModel.fromJson(Map<String, dynamic> json) => RedCardsNoValueModel(
      homeRedCardsNo: json["home_red_cards_no"],
      awayRedCardsNo:json['away_red_cards_no']

  );
}