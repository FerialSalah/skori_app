import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/players/presentation/bloc/player_statistics_bloc.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistic_card.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistics_info.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../news/presentation/widgets/all_news_list.dart';
import '../../../news/presentation/widgets/new_news_list.dart';
import '../../domain/entity/player_statistics_entity.dart';

class PlayerStatistics extends StatelessWidget {

   PlayerStatistics({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerStatisticsBloc, BaseState>(
      builder: (context, state) {
        final playerStatistics = BlocProvider.of<PlayerStatisticsBloc>(context).playerStatisticsEntity;

        if(state is LoadingState){
          return ColorLoader();
        }else if(state is SuccessState){
          return   SingleChildScrollView(
            child: Column(
              children: [
                PlayerStatisticCard(statistics: playerStatistics!.goalsNumber,title: LocaleKeys.goals.tr(),),
                PlayerStatisticCard(statistics: playerStatistics.cards,title: LocaleKeys.cards.tr()),
                PlayerStatisticCard(statistics: playerStatistics.passes,title: LocaleKeys.passes.tr(),),
                PlayerStatisticCard(statistics: playerStatistics.attemptsAtGoalNo,title: LocaleKeys.attemptsGoal.tr(),),
                PlayerStatisticCard(statistics: playerStatistics.others,title: LocaleKeys.others.tr(),),
              ],
            ),
          );
        }else if(state is OfflineState){
          return OfflinePage();
        }else if(state is ErrorState){
          return Center(child: MainText(text: state.msg,));
        }else{
          return MainText(text: LocaleKeys.serverError.tr(),);
        }

      },
    );
  }
}


