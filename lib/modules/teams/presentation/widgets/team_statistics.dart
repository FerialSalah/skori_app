import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/teams/presentation/bloc/team_statistics_bloc.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../players/presentation/widgets/player_statistic_card.dart';

class TeamStatistics extends StatelessWidget {

  TeamStatistics({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamStatisticsBloc, BaseState>(
      builder: (context, state) {
        final teamStatistics = BlocProvider.of<TeamStatisticsBloc>(context).teamStatistics;

        if(state is LoadingState){
          return ColorLoader();
        }else if(state is SuccessState){
          return   SingleChildScrollView(
            child: Column(
              children: [
                PlayerStatisticCard(statistics: teamStatistics!.matchesNumber,title: LocaleKeys.matchesInsights.tr(),),
                PlayerStatisticCard(statistics: teamStatistics.goalsNumber,title: LocaleKeys.goals.tr(),),
                PlayerStatisticCard(statistics: teamStatistics.cards,title: LocaleKeys.cards.tr()),
                PlayerStatisticCard(statistics: teamStatistics.passes,title: LocaleKeys.passes.tr(),),
                PlayerStatisticCard(statistics: teamStatistics.attemptsAtGoalNo,title: LocaleKeys.attemptsGoal.tr(),),
                PlayerStatisticCard(statistics: teamStatistics.others,title: LocaleKeys.others.tr(),),
              ],
            ),
          );

        }else if(state is OfflineState){
          return OfflinePage();
        }else if(state is ErrorState){
          if(AppStorage.isLogged) return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.not_interested_outlined,color: ColorApp.error,size: 40,),
              SizedBox(
                height: 10.h,
              ),
              MainText(
                text: LocaleKeys.packageUnavailable.tr(),
                font: 15,
                family: TextFontApp.boldFont,
                center: true,
              ),
            ],
          ));
          return ShouldSignUp();
         // return Center(child: MainText(text: state.msg,family: TextFontApp.boldFont,));
        }else{
          return MainText(text: LocaleKeys.serverError.tr(),);
        }

      },
    );

  }
}


