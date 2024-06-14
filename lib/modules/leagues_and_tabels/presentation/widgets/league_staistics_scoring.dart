import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_assists_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_scores_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_discipline_card.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_top_assists.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/top_score_card.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/top_scores_items.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import 'league_top_scores.dart';
class LeagueStatisticsScoring extends StatelessWidget {
  const LeagueStatisticsScoring({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 600.h,
            child: LeagueTopScores()),
        SizedBox(
          height: 600.h,
          child: LeagueTopAssists(),)
      ],
    );

  }
}
