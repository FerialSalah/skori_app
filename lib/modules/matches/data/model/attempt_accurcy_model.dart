import 'package:skori/modules/matches/domain/entity/attempts_accuracy_entity.dart';

class AttemptsAccuracyModel extends AttemptsAccuracyEntity{
  AttemptsAccuracyModel({
    required super.name,
    required super.value
  });

  factory AttemptsAccuracyModel.fromJson(Map<String, dynamic> json) => AttemptsAccuracyModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:
      AttemptsAccuracyValueModel.fromJson(json['value'])

  );

}

class AttemptsAccuracyValueModel extends AttemptsAccuracyValueEntity{
  AttemptsAccuracyValueModel({
    required super.homeAttemptsAccuracy,
    required super.awayAttemptsAccuracy
  });
  factory AttemptsAccuracyValueModel.fromJson(Map<String, dynamic> json) => AttemptsAccuracyValueModel(
      homeAttemptsAccuracy: json["home_passes_accuracy"],
      awayAttemptsAccuracy:json['home_passes_accuracy']

  );
}