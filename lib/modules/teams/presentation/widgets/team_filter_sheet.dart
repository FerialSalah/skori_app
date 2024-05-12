import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/customTextFeild.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/country/country_cubit.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/drop_down_text_field.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import '../bloc/team_bloc.dart';
import '../bloc/team_event.dart';





class TeamFilterSheet extends StatefulWidget {
  const TeamFilterSheet({Key? key}) : super(key: key);

  @override
  State<TeamFilterSheet> createState() => _TeamFilterSheetState();
}

class _TeamFilterSheetState extends State<TeamFilterSheet> {
  @override
  void initState() {
    BlocProvider.of<TeamsBloc>(context).countryId=null;
    BlocProvider.of<TeamsBloc>(context).tournamentId=null;
    BlocProvider.of<TeamsBloc>(context).name=null;
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
                hint: LocaleKeys.teamName.tr(),
                onChange: (v){
                  BlocProvider.of<TeamsBloc>(context).name=v;
                },

              ),
              BlocBuilder<LeaguesBloc, BaseState>(
                builder: (context, state) {
                  final leagues = BlocProvider.of<LeaguesBloc>(context).leagues;
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
                      BlocProvider.of<TeamsBloc>(context).tournamentId=val;
                    },
                  );
                },
              ),
              BlocBuilder<CountriesCubit, BaseState>(
                builder: (context, state) {
                  final countries = BlocProvider.of<CountriesCubit>(context).countriesModel;
                  return DropDownTextField(
                    hint: LocaleKeys.countries.tr(),
                    icon: AppIcons.filter,
                    isModel: true,
                    isFilterMatchTeam: false,
                    items: countries!.data!,
                    team: false,
                    country: true,
                    paddingVer: 5,
                    paddingHor: 0,
                    onChanged: (val) {
                      BlocProvider.of<TeamsBloc>(context).countryId=val;
                    },
                  );
                },
              ),
              SizedBox(height: 20,),
              AppButton(title: LocaleKeys.search.tr(),height: 45.h,onPressed: (){
                BlocProvider.of<TeamsBloc>(context)
                  ..add(GetTeamsData());
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
