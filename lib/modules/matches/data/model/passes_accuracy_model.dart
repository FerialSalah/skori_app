import 'package:skori/modules/matches/domain/entity/attempts_accuracy_entity.dart';
import 'package:skori/modules/matches/domain/entity/passes_accuracy_entity.dart';

class PassesAccuracyModel extends PassesAccuracyEntity{
  PassesAccuracyModel({
    required super.name,
    required super.value
  });

  factory PassesAccuracyModel.fromJson(Map<String, dynamic> json) => PassesAccuracyModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:
      PassesAccuracyValueModel.fromJson(json['value'])

  );

}

class PassesAccuracyValueModel extends PassesAccuracyValueEntity{
  PassesAccuracyValueModel({
    required super.homePassesAccuracy,
    required super.awayPassesAccuracy
  });
  factory PassesAccuracyValueModel.fromJson(Map<String, dynamic> json) => PassesAccuracyValueModel(
      homePassesAccuracy: json["home_passes_accuracy"],
      awayPassesAccuracy:json['home_passes_accuracy']

  );
}