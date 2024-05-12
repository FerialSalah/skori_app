import 'package:equatable/equatable.dart';
import 'package:skori/modules/matches/domain/entity/PassessionEntity.dart';
import 'package:skori/modules/matches/domain/entity/assists_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/awarded_fouls_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/clean_sheets_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/committed_fouls_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/corner_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/crosses_open_play_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/goals_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/long_pass_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/offside_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/own_goals_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/passes_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/planties_missed_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/planties_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/red_cards_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/saves_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/yellow_card_no_entity.dart';

import 'cross_set_pieces_no_entity.dart';
import 'crosses_no_entity.dart';
import 'expected_goals_aginst_no_entity.dart';

class StatisticsEntity extends Equatable{
  List<PossessionEntity>? possession;
  List<GoalsNoEntity>? goalsNo;
  List<PassesNoEntity>? passesNo;
  List<LongPassNoEntity>? longPassesNo;
  List<CrossesOpenPlayNoEntity>? crossesOpenPlayNo;
  List<AwardFoulsNoEntity>? awardedFoulsNo;
  List<CommittedFoulsNoEntity>? committedFoulsNo;
  List<PenaltiesNoEntity>? penaltiesNo;
  List<CleanSheetsNoEntity>? cleanSheetsNo;
  List<OwnGoalsNoEntity>? ownGoalsNo;
  List<YellowCardsNoEntity>? yellowCardsNo;
  List<RedCardsNoEntity>? redCardsNo;
  List<AssistsNoEntity>? assistsNo;
  List<SavesNoEntity>? savesNo;
  List<CornerNoEntity>? cornerNo;
  List<PenaltiesMissedNoEntity>? penaltiesMissedNo;
 List<OffsideNoEntity> offsideNo;
 List<CrossesNoEntity> crossesNo;
  List<CrossSetPiecesNoEntity>? crossSetPiecesNo;
  List<ExpectedGoalsAgainstNoEntity>? expectedGoalsAgainstNo;

  StatisticsEntity( {
    required this.possession,
    required this.goalsNo,
    required this.passesNo,
    required this.longPassesNo,
    required this.crossesOpenPlayNo,
    required this.awardedFoulsNo,
    required this.committedFoulsNo,
    required this.penaltiesNo,
    required this.cleanSheetsNo,
    required this.ownGoalsNo,
    required this.yellowCardsNo,
    required this.redCardsNo,
    required this.assistsNo,
    required this.savesNo,
    required this.cornerNo,
    required this.penaltiesMissedNo,
    required this.offsideNo,
    required this.crossesNo,
    required this.crossSetPiecesNo,
    required this.expectedGoalsAgainstNo


  });

  @override
  List<Object?> get props => [];

}

