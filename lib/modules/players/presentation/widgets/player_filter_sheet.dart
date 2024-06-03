import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/customTextFeild.dart';
import 'package:skori/modules/players/presentation/bloc/players_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import 'package:skori/modules/teams/presentation/bloc/team_bloc.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/drop_down_text_field.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';






class PlayerFilterSheet extends StatefulWidget {
  const PlayerFilterSheet({Key? key}) : super(key: key);

  @override
  State<PlayerFilterSheet> createState() => _PlayerFilterSheetState();
}

class _PlayerFilterSheetState extends State<PlayerFilterSheet> {
  @override
  void initState() {
    BlocProvider.of<PlayersBloc>(context).countryId=null;
    BlocProvider.of<PlayersBloc>(context).teamId=null;
    BlocProvider.of<PlayersBloc>(context).playerName=null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430.h,
      color: Colors.transparent,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight:
                  Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText(
                text: LocaleKeys.searchType.tr(),
                font: 20,
                family: TextFontApp.boldFont,
              ),
              SizedBox(height: 10,),
              MainText(
                text: LocaleKeys.chooseSearch.tr(),
                font: 14,
                color: ColorApp.hintGray,
                family: TextFontApp.regularFont,
              ),
              SizedBox(height: 20,),
              CustomTextField(
                hint: LocaleKeys.playerName.tr(),
                onChange: (v){
                  BlocProvider.of<PlayersBloc>(context).playerName=v;
                },

              ),

              BlocBuilder<TeamsBloc, BaseState>(
                builder: (context, state) {
                  final teams = BlocProvider.of<TeamsBloc>(context).filterTeams;
                  print("player teams:$teams");
                  return DropDownTextField(
                    hint: LocaleKeys.teams.tr(),
                    icon: AppIcons.filter,
                    isModel: true,
                    items: teams,
                    isFilterMatchTeam: false,
                    team: true,
                    teamName: LocaleKeys.teams.tr(),
                    paddingVer: 5,
                    paddingHor: 0,
                    onChanged: (val) {
                     // BlocProvider.of<PlayersBloc>(context).teamId=val;
                      print(" team val is:$val");
                      print(val.id);
                      // print("name is :${teams.singleWhere((e)=>e.name==val)}");
                      // final team= teams.singleWhere((e)=>e.name==val);
                      print("val.id: ${val.id}");
                      print("val.name:${val.name}");
                    },
                  );
                },
              ),
              // BlocBuilder<CountriesCubit, BaseState>(
              //   builder: (context, state) {
              //     final countries = BlocProvider.of<CountriesCubit>(context).countriesModel;
              //     return DropDownTextField(
              //       hint: LocaleKeys.countries.tr(),
              //       icon: AppIcons.filter,
              //       isModel: true,
              //       items: countries!.data!,
              //       team: false,
              //       country: true,
              //       paddingVer: 5,
              //       paddingHor: 0,
              //       onChanged: (val) {
              //         BlocProvider.of<PlayersBloc>(context).countryId=val;
              //       },
              //     );
              //   },
              // ),
              SizedBox(height: 20,),
              AppButton(title: LocaleKeys.search.tr(),height: 45.h,onPressed: (){
                BlocProvider.of<PlayersBloc>(context)
                  ..add(GetPlayersData());
                RouteManager.pop();
              },),


              SizedBox(
                height: 10,
              ),

            ],
          )),
    );
  }
}
