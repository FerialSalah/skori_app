
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';


class TablesModel {
  TablesModel({
    required this.data,
  });

  List<LeagueStageModel> data;

  factory TablesModel.fromJson(Map<String, dynamic> json) => TablesModel(
    data: json["data"] == null ? [] : List<LeagueStageModel>.from(json["data"]!.map((x) => LeagueStageModel.fromJson(x))),
  );

}

class LeagueStageModel extends LeagueStageEntity{
  LeagueStageModel({
    super.id,
    super.title,
    super.ranks
});

  factory LeagueStageModel.fromJson(Map<String, dynamic> json) => LeagueStageModel(
    id: json["id"],
    title: json['title'],
    ranks: json['ranks']==null? null :List<TableModel>.from(json["ranks"]!.map((x) => TableModel.fromJson(x)))


  );
}



class TableModel extends TableEntity {
  TableModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.description,
    required super.differentGoalsNo,
    required super.drawMatchesNo,
    required super.loseMatchesNo,
    required super.matchesNo,
    required super.pointsNo,
    required super.reverseGoalsNo,
    required super.scoreGoalsNo,
    required super.teamCover,
    required super.winMatchesNo
  });


  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    matchesNo: json["matches_no"],
    pointsNo: json["points_no"],
    winMatchesNo: json["win_matches_no"],
    loseMatchesNo: json["lose_matches_no"],
    drawMatchesNo: json["draw_matches_no"],
    scoreGoalsNo: json['score_goals_no'],
    reverseGoalsNo: json['reverse_goals_no'],
    differentGoalsNo: json['different_goals_no'],
    description: json['description'],
    teamCover: json['team_cover'],


  );

}





