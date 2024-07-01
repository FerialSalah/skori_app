import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/empty.dart';
import 'package:skori/core/widgets/offline_widget.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/matches/presentation/bloc/previous_matches_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/matches_card.dart';

import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/should_sign_up.dart';
class LastHeadToHeadMatches extends StatefulWidget {
  const LastHeadToHeadMatches({Key? key}) : super(key: key);

  @override
  State<LastHeadToHeadMatches> createState() => _LastHeadToHeadMatchesState();
}

class _LastHeadToHeadMatchesState extends State<LastHeadToHeadMatches> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviousMatchesBloc, BaseState>(
      builder: (context, state) {
        final lastHeadMatches =
            BlocProvider.of<PreviousMatchesBloc>(context).previousMatches;

        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lastHeadMatches.isEmpty
                  ? emptyShow()
                  : SizedBox(
                height: 200.h,
                child: ListView.separated(
                    shrinkWrap: true,

                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    itemBuilder: (context, index) => MatchesCard(
                      isMatchScreen: false,
                      homeTeamId: lastHeadMatches[index].homeTeamId,
                      awayTeamId: lastHeadMatches[index].awayTeamId,
                      id: lastHeadMatches[index].id,
                      title:lastHeadMatches[index].season,
                      type:lastHeadMatches[index].type ,
                      watchLink: lastHeadMatches[index].watchLink,
                      homeTeamName: lastHeadMatches[index].homeTeamName,
                      homeTeamScore: lastHeadMatches[index].homeTeamScore,
                      homeTeamLogo: lastHeadMatches[index].homeTeamLogo,
                      awayTeamName: lastHeadMatches[index].awayTeamName,
                      awayTeamScore: lastHeadMatches[index].awayTeamScore,
                      awayTeamLogo: lastHeadMatches[index].awayTeamLogo,
                      logo: lastHeadMatches[index].logo,
                      time: lastHeadMatches[index].time,
                      date: lastHeadMatches[index].date,
                      currentTime: lastHeadMatches[index].currentTime,
                      stadium: lastHeadMatches[index].stadium,

                    ),
                    separatorBuilder: (context, _) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: lastHeadMatches.length),
              ),

            ],
          );
        } else if (state is OfflineState) {
          return OfflinePage();
        } else if (state is ErrorState) {
          // if(AppStorage.isLogged) return Center(child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.not_interested_outlined,color: ColorApp.error,size: 40,),
          //     SizedBox(
          //       height: 10.h,
          //     ),
          //     MainText(
          //       text: LocaleKeys.packageUnavailable.tr(),
          //       font: 15,
          //       family: TextFontApp.boldFont,
          //       center: true,
          //     ),
          //   ],
          // ));
          // return ShouldSignUp();
          return Container();
        } else {
          return MainText(
            text: LocaleKeys.serverError.tr(),
          );
        }
      },
    );

  }
}
