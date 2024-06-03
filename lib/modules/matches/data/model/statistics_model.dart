import 'package:skori/modules/matches/data/model/assists_no_model.dart';
import 'package:skori/modules/matches/data/model/attempt_accurcy_model.dart';
import 'package:skori/modules/matches/data/model/awarded_fouls_no_model.dart';
import 'package:skori/modules/matches/data/model/clean_sheets_no_model.dart';
import 'package:skori/modules/matches/data/model/committed_fouls_no_model.dart';
import 'package:skori/modules/matches/data/model/corner_no_model.dart';
import 'package:skori/modules/matches/data/model/cross_pieces_no_model.dart';
import 'package:skori/modules/matches/data/model/crosses_open_play_no_model.dart';
import 'package:skori/modules/matches/data/model/expected_goals_against_no_model.dart';
import 'package:skori/modules/matches/data/model/goals_no_model.dart';
import 'package:skori/modules/matches/data/model/long_passes_no_model.dart';
import 'package:skori/modules/matches/data/model/offside_no_model.dart';
import 'package:skori/modules/matches/data/model/passes_accuracy_model.dart';
import 'package:skori/modules/matches/data/model/passes_no_model.dart';
import 'package:skori/modules/matches/data/model/penalites_no_model.dart';
import 'package:skori/modules/matches/data/model/planties_missed_no_model.dart';
import 'package:skori/modules/matches/data/model/possession_model.dart';
import 'package:skori/modules/matches/data/model/red_cards_no_model.dart';
import 'package:skori/modules/matches/data/model/saves_no_model.dart';
import 'package:skori/modules/matches/data/model/yellow_cards_no_model.dart';
import 'package:skori/modules/matches/domain/entity/statistics_entity.dart';

import 'crosses_no_model.dart';
import 'own_goals_no_model.dart';

class StatisticsModel extends StatisticsEntity{
  StatisticsModel({
    required super.possession,
    required super.goalsNo,
    required super.longPassesNo,
    required super.crossesOpenPlayNo,
    required super.awardedFoulsNo,
    required super.committedFoulsNo,
    required super.penaltiesNo,
    required super.cleanSheetsNo,
    required super.ownGoalsNo,
    required super.yellowCardsNo,
    required super.redCardsNo,
    required super.assistsNo,
    required super.savesNo,
    required super.cornerNo,
    required super.crossesNo,
    required super.crossSetPiecesNo,
    required super.expectedGoalsAgainstNo,
    required super.penaltiesMissedNo,
    required super.offsideNo,
    required super.passesNo,
    required super.passesAccuracy,
    required super.attemptsAccuracy

  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) => StatisticsModel(
    possession: json['possession'] == null ? []
        : (json['possession'] as List).map((e) => PossessionModel.fromJson(e)).toList(),
    goalsNo: json['goals_no'] == null ? []
        : (json['goals_no'] as List).map((e) => GoalsNoModel.fromJson(e)).toList(),
    longPassesNo: json['long_passes_no'] == null ? []
        : (json['long_passes_no'] as List).map((e) => LongPassesNoModel.fromJson(e)).toList(),
    crossesOpenPlayNo: json['crosses_open_play_no'] == null ? []
        : (json['crosses_open_play_no'] as List).map((e) => CrossesOpenPlayNoModel.fromJson(e)).toList(),
    awardedFoulsNo: json['awarded_fouls_no'] == null ? []
        : (json['awarded_fouls_no'] as List).map((e) => AwardFoulsNoModel.fromJson(e)).toList(),
    committedFoulsNo: json['committed_fouls_no'] == null ? []
        : (json['committed_fouls_no'] as List).map((e) => CommittedFoulsNoModel.fromJson(e)).toList(),
    penaltiesNo: json['penalties_no'] == null ? []
        : (json['penalties_no'] as List).map((e) => PenaltiesNoModel.fromJson(e)).toList(),
    cleanSheetsNo: json['clean_sheets_no'] == null ? []
        : (json['clean_sheets_no'] as List).map((e) => CleanSheetsNoModel.fromJson(e)).toList(),
    ownGoalsNo: json['own_goals_no'] == null ? []
        : (json['own_goals_no'] as List).map((e) => OwnGoalsNoModel.fromJson(e)).toList(),
    yellowCardsNo: json['yellow_cards_no'] == null ? []
        : (json['yellow_cards_no'] as List).map((e) => YellowCardsNoModel.fromJson(e)).toList(),
    redCardsNo: json['red_cards_no'] == null ? []
        : (json['red_cards_no'] as List).map((e) => RedCardsNoModel.fromJson(e)).toList(),
    assistsNo: json['assists_no'] == null ? []
        : (json['assists_no'] as List).map((e) => AssistsNoModel.fromJson(e)).toList(),
    savesNo: json['saves_no'] == null ? []
        : (json['saves_no'] as List).map((e) => SavesNoModel.fromJson(e)).toList(),
    cornerNo: json['corner_no'] == null ? []
        : (json['corner_no'] as List).map((e) => CornerNoModel.fromJson(e)).toList(),
    penaltiesMissedNo: json['penalties_missed_no']==null? []:
    (json['penalties_missed_no'] as List).map((e) => PenaltiesMissedNoModel.fromJson(e)).toList(),
      offsideNo: json['offside_no']==null? []:
      (json['offside_no'] as List).map((e) => OffsideNoModel.fromJson(e)).toList(),
   crossesNo:  json['crosses_no'] == null ? []
        : (json['crosses_no'] as List).map((e) => CrossesNoModel.fromJson(e)).toList(),
    crossSetPiecesNo:  json['crosses_no'] == null ? []
        : (json['cross_set_peices_no'] as List).map((e) => CrossSetPiecesNoModel.fromJson(e)).toList(),
    expectedGoalsAgainstNo: json['expected_goals_aginst_no'] == null ? []
        : (json['expected_goals_aginst_no'] as List).map((e) => ExpectedGoalsAgainstNoModel.fromJson(e)).toList(),
    passesNo: json['passes_no'] == null ? []
        : (json['passes_no'] as List).map((e) => PassesNoModel.fromJson(e)).toList(),
    passesAccuracy: json['passes_accuracy'] == null ? []
        : (json['passes_accuracy'] as List).map((e) => PassesAccuracyModel.fromJson(e)).toList(),

    attemptsAccuracy: json['attempts_accuracy'] == null ? []
        : (json['attempts_accuracy'] as List).map((e) => AttemptsAccuracyModel.fromJson(e)).toList(),
  );

}