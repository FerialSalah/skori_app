import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';
import 'package:skori/modules/players/presentation/bloc/player_statistics_bloc.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/season/season_cubit.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/button_app.dart';
import '../../../../core/widgets/drop_down_text_field.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import '../bloc/players_event.dart';
class PlayerFilterStatisticsSheet extends StatefulWidget {
  final int playerId;
  const PlayerFilterStatisticsSheet({Key? key, required this.playerId}) : super(key: key);

  @override
  State<PlayerFilterStatisticsSheet> createState() => _PlayerFilterStatisticsSheetState();
}

class _PlayerFilterStatisticsSheetState extends State<PlayerFilterStatisticsSheet> {

  @override
  void initState() {
    BlocProvider.of<PlayerStatisticsBloc>(context).tournamentId = null;
    BlocProvider.of<PlayerStatisticsBloc>(context).seasonId = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      color: Colors.transparent, //could change this to Color(0xFF737373),
      child: Material(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
        SizedBox(
          height: 10.h,
        ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          BlocProvider.of<PlayerStatisticsBloc>(context).tournamentId =

                           BlocProvider.of<PlayerStatisticsBloc>(context).seasonId = "";

                           RouteManager.pop();
                        },
                        child: MainText(
                          text: LocaleKeys.clear.tr(),
                          font: 16,
                          color: ColorApp.primary,
                          family: TextFontApp.boldFont,
                        )),
                    GestureDetector(
                        onTap: () {
                          RouteManager.pop();
                        },
                        child: Icon(Icons.close)),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),


                BlocBuilder<LeaguesBloc, BaseState>(
                  builder: (context, state) {
                    final leagues =
                        BlocProvider.of<LeaguesBloc>(context).leagues;
                    return DropDownTextField(
                      hint: LocaleKeys.leagues.tr(),
                      icon: AppIcons.filter,
                      isModel: true,
                      isFilterMatchTeam: false,
                      items: leagues,
                      team: false,
                      paddingVer: 5,
                      paddingHor: 0,
                      onChanged: (val) {
                        print("leagues val is:$val");
                        BlocProvider.of<PlayerStatisticsBloc>(context).tournamentId =
                            val;

                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),

                BlocBuilder<SeasonsCubit, BaseState>(
                  builder: (context, state) {
                    final seasons =
                        BlocProvider.of<SeasonsCubit>(context).seasonModel;
                    return DropDownTextField(
                      hint: LocaleKeys.stages.tr(),
                      icon: AppIcons.filter,
                      isModel: true,
                      isFilterMatchTeam: false,
                      items: seasons!.data,
                      team: false,
                      country: false,
                      season: true,
                      paddingVer: 5,
                      paddingHor: 0,
                      onChanged: (val) {
                        BlocProvider.of<PlayerStatisticsBloc>(context).seasonId = val;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),

                // SizedBox(height: 1,),
                BlocBuilder<PlayerStatisticsBloc, BaseState>(
                  builder: (context, state) {
                    return  AppButton(
                      title: LocaleKeys.apply.tr(),
                      onPressed: () async{
                     await   BlocProvider.of<PlayerStatisticsBloc>(context)
                          ..add(GetPlayerNewStatistics(id: widget.playerId));
                        RouteManager.pop();
                      },
                    );
                  },
                ),




              ],
            )),
      ),
    );
  }
}
