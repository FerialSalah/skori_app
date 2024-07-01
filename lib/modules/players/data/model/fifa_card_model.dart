import 'package:skori/modules/players/domain/entity/fifa_card_entity.dart';

class FifaCardModel extends FifaCardEntity{
  FifaCardModel({required super.playingTime, required super.win, required super.attemptsSaved, required super.passes});


  factory FifaCardModel.fromJson(Map<String, dynamic> json) => FifaCardModel(
     playingTime:
     json["playing_time"]!=null ?FifaCardValueModel.fromJson(json["playing_time"]):null,
      win: json['win']!=null?FifaCardValueModel.fromJson(json['win']):null,
    attemptsSaved: json['attempts_saved']!=null?FifaCardValueModel.fromJson(json['attempts_saved']):null,
    passes: json['passes']!=null?FifaCardValueModel.fromJson(json['passes']):null

  );
}

class FifaCardValueModel extends FifaCardValueEntity{
  FifaCardValueModel({required super.title, required super.value});
  factory FifaCardValueModel.fromJson(Map<String, dynamic> json)=> FifaCardValueModel(
      title: json['title'], value: json['value']);
}