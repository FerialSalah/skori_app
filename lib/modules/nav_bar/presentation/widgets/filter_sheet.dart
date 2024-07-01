import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/cubit/country/country_cubit.dart';
import 'package:skori/core/cubit/season/season_cubit.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_bloc.dart';
import 'package:skori/modules/teams/presentation/bloc/team_bloc.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/button/button_app.dart';
import '../../../../core/widgets/drop_down_text_field.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/matches_event.dart';

class FilterSheet extends StatefulWidget {
  FilterSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  DateTime focusedDate = DateTime.now();
  dynamic teams;

  @override
  void initState() {
    BlocProvider.of<MatchesBloc>(context).countryId = null;
    BlocProvider.of<MatchesBloc>(context).tournamentId = null;
    BlocProvider.of<MatchesBloc>(context).seasonId = null;
    BlocProvider.of<TeamsBloc>(context).tournamentId = null;

    // teams=BlocProvider.of<TeamsBloc>(context).filterTeams;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
     // height: 700.h,
      color: Colors.transparent, //could change this to Color(0xFF737373),
      child: Material(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<MatchesBloc>(context).date = "";
                            BlocProvider.of<MatchesBloc>(context).teamId = "";
                            BlocProvider.of<MatchesBloc>(context).tournamentId =
                                "";
                            BlocProvider.of<MatchesBloc>(context).countryId = "";
                            BlocProvider.of<MatchesBloc>(context).seasonId = "";
              
                            BlocProvider.of<MatchesBloc>(context)
                              ..add(GetMatchesData());
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
              
                  TableCalendar(
                    rangeSelectionMode: RangeSelectionMode.disabled,
                    calendarFormat: CalendarFormat.month,
                    locale: RouteManager.currentContext.locale.languageCode,
                    calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                      color: ColorApp.primary,
                      shape: BoxShape.circle,
                    )),
                    headerStyle: HeaderStyle(
                        formatButtonShowsNext: false,
                        titleCentered: true,
                        formatButtonVisible: false),
                    onHeaderTapped: (v) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Select Year"),
                            content: Container(
                              // Need to use container to add size constraint.
                              width: 300,
                              height: 300,
                              child: YearPicker(
                                firstDate: DateTime(DateTime.now().year - 100, 1),
                                lastDate: DateTime(DateTime.now().year + 100, 1),
                                initialDate: DateTime.now(),
                                selectedDate: DateTime.now(),
                                onChanged: (DateTime dateTime) {
                                  setState(() {
                                    focusedDate = dateTime;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: focusedDate,
                    currentDay: _selectedDay,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        BlocProvider.of<MatchesBloc>(context).date =
                            reformatDate(selectedDay);
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      print(_focusedDay);
                      print(_selectedDay);
                    },
                  ),
                  BlocBuilder<LeaguesBloc, BaseState>(
                    builder: (context, state) {
                      final leagues =
                          BlocProvider.of<LeaguesBloc>(context).leagues;
                      return DropDownTextField(
                        hint: LocaleKeys.leagues.tr(),
                        icon: AppIcons.filter,
                        isModel: true,
                        items: leagues,
                        team: false,
                        paddingVer: 5,
                        paddingHor: 0,
                        isFilterMatchTeam: false,
                        onChanged: (val) {
                          print("leagues val is:$val");
                          BlocProvider.of<MatchesBloc>(context).tournamentId =
                              val;
                          BlocProvider.of<TeamsBloc>(context).tournamentId = val;
                          BlocProvider.of<TeamsBloc>(context)
                            ..add(GetFilterTeamsData());
                        },
                      );
                    },
                  ),
                  BlocBuilder<TeamsBloc, BaseState>(
                    builder: (context, state) {
                      final teams =
                          BlocProvider.of<TeamsBloc>(context).filterTeams;
                      print("teams in matches:$teams");
              
                      return DropDownTextField(
                        hint: LocaleKeys.teams.tr(),
                        icon: AppIcons.filter,
                        isModel: true,
                        teams: teams,
                        team: true,
                        isFilterMatchTeam: true,
                        teamName: LocaleKeys.teams.tr(),
                        paddingVer: 5,
                        paddingHor: 0,
                        onChanged: (val) {
                          print(" team val is:$val");
                          print(val.id);
                          // print("name is :${teams.singleWhere((e)=>e.name==val)}");
                          // final team= teams.singleWhere((e)=>e.name==val);
                          print("val.id: ${val.id}");
                          print("val.name:${val.name}");
              
              
              
                          BlocProvider.of<MatchesBloc>(context).teamId = val.id.toString();
                        },
                      );
                    },
                  ),
              
                  BlocBuilder<CountriesCubit, BaseState>(
                    builder: (context, state) {
                      final countries =
                          BlocProvider.of<CountriesCubit>(context).countriesModel;
                      return DropDownTextField(
                        hint: LocaleKeys.countries.tr(),
                        icon: AppIcons.filter,
                        isModel: true,
                        items: countries!.data!,
                        isFilterMatchTeam: false,
                        team: false,
                        country: true,
                        paddingVer: 5,
                        paddingHor: 0,
                        onChanged: (val) {
                          print(val);
                          BlocProvider.of<MatchesBloc>(context).countryId = val;
                        },
                      );
                    },
                  ),
                  BlocBuilder<SeasonsCubit, BaseState>(
                    builder: (context, state) {
                      final seasons =
                          BlocProvider.of<SeasonsCubit>(context).seasonModel;
                      print("seasons in match filter : ${seasons!.data}");
                      return DropDownTextField(
                        hint: LocaleKeys.stages.tr(),
                        icon: AppIcons.filter,
                        isModel: true,
                        isFilterMatchTeam: false,
                        items: seasons.data,
                        team: false,
                        country: false,
                        season: true,
                        paddingVer: 5,
                        paddingHor: 0,
                        onChanged: (val) {
                          BlocProvider.of<MatchesBloc>(context).seasonId = val;
                          print(BlocProvider.of<MatchesBloc>(context).seasonId);
                        },
                      );
                    },
                  ),
                  // SizedBox(height: 1,),
              
                  BlocBuilder<MatchesBloc, BaseState>(
                    builder: (context, state) {
                      return AppButton(
                        title: LocaleKeys.apply.tr(),
                        onPressed: () {
                          // BlocProvider.of<MatchesBloc>(context).date="";
              
                          BlocProvider.of<MatchesBloc>(context)
                            ..add(GetMatchesData());
                          RouteManager.pop();
                        },
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
