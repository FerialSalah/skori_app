import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_event.dart';
import 'package:skori/modules/matches/presentation/screens/matches.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/home/title_and_all.dart';
import '../../../data/model/matches_model.dart';
import '../matches_card.dart';

class LiveMatchesList extends StatelessWidget {
  final List<MatchEntity> matches;

  const LiveMatchesList({Key? key, required this.matches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndAll(
            title: LocaleKeys.matches.tr(),
            description: LocaleKeys.matchesHint.tr(),
            onPressed: () {
              BlocProvider.of<MatchesBloc>(context).countryId = null;
              BlocProvider.of<MatchesBloc>(context).tournamentId = null;
              BlocProvider.of<MatchesBloc>(context).date = null;
              BlocProvider.of<MatchesBloc>(context).teamId = null;
              BlocProvider.of<MatchesBloc>(context).seasonId = null;


              BlocProvider.of<MatchesBloc>(context)..add(GetMatchesData());
              RouteManager.navigateTo(MatchesScreen());
            }),
        // Container(
        //   height: 35.h,
        //   child: ListView.separated(
        //       padding: EdgeInsets.symmetric(horizontal: 16.w),
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context,index)=>Container(
        //         width: 75.h,
        //         height: 35.w,
        //         decoration: BoxDecoration(
        //           border: Border.all(color: ColorApp.borderGray,width: 1),
        //         ),
        //         child: Center(child: MainText(text: "Today",font: 12,family: TextFontApp.regularFont,)),
        //       ),
        //       separatorBuilder: (context,_)=>SizedBox(width:10.w,),
        //       itemCount: 4),
        // ),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    print("tappppppping");
                  },
                  child: MatchesCard(
                    id: matches[index].id,
                    title: matches[index].season,
                    type: matches[index].type,
                    watchLink: matches[index].watchLink,
                    homeTeamName: matches[index].homeTeamName,
                    homeTeamScore: matches[index].homeTeamScore,
                    homeTeamLogo: matches[index].homeTeamLogo,
                    awayTeamName: matches[index].awayTeamName,
                    awayTeamScore: matches[index].awayTeamScore,
                    awayTeamLogo: matches[index].awayTeamLogo,
                    logo: matches[index].logo,
                    time: matches[index].time,
                    date: matches[index].date,
                    currentTime: matches[index].currentTime,
                    homeTeamId: matches[index].homeTeamId,
                    awayTeamId: matches[index].awayTeamId,
                    isMatchScreen: false,
                    stadium: matches[index].stadium,
                  ),
                ),
            separatorBuilder: (context, _) => SizedBox(
                  height: 10.h,
                ),
            itemCount: matches.length),
      ],
    );
  }
}
