import 'package:skori/modules/leagues_and_tabels/data/model/league_top_model.dart';

class LeaguesTopsModel{
  LeaguesTopsModel({
    required this.data,
  });
  List<LeagueTopModel>? data;


      factory LeaguesTopsModel.fromJson(Map<String, dynamic> json) =>
          LeaguesTopsModel(
        data: json["data"] == null
            ? []
            : List<LeagueTopModel>.from(
            json["data"]!.map((x) => LeagueTopModel.fromJson(x))),
      );
}

