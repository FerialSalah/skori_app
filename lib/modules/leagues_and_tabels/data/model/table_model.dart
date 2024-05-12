
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';


class TablesModel {
  TablesModel({
    required this.data,
  });

  List<TableModel> data;

  factory TablesModel.fromJson(Map<String, dynamic> json) => TablesModel(
    data: json["data"] == null ? [] : List<TableModel>.from(json["data"]!.map((x) => TableModel.fromJson(x))),
  );

}



class TableModel extends TableEntity {
  TableModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.matchesNum,
    required super.points,
    required super.win,
    required super.draw,
    required super.lose,
    required super.scoreGoal,
    required super.reverseGoal,
    required super.differentGoal,
    required super.countryFlag,
    required super.countryName,
    required super.isFavorite,
    required super.isFollow,
  });


  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    matchesNum: json["matches_no"],
    points: json["points_no"],
    win: json["win_matches_no"],
    lose: json["lose_matches_no"],
    draw: json["draw_matches_no"],
    scoreGoal: json['score_goals_no'],
    reverseGoal: json['reverse_goals_no'],
    differentGoal: json['different_goals_no'],
    isFavorite: json['is_favorite'],
    isFollow: json['is_follow'],
    countryName: json['country_name'],
    countryFlag: json['country_flag']

  );

}





