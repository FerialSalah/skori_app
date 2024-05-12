import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/home/title_and_all.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import 'package:skori/modules/teams/presentation/screens/team_profile.dart';
import 'package:skori/modules/teams/presentation/screens/all_teams.dart';
import '../../../../../core/cubit/follow_cubit.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/follow_button.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../teams/presentation/bloc/team_bloc.dart';
import '../../../../teams/presentation/bloc/team_event.dart';
import '../../../../../core/injection/injection_app.dart' as di;

class FollowTeams extends StatelessWidget {
  final List<TeamEntity> teams;
  const FollowTeams({Key? key, required this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndAll(
          title: LocaleKeys.followTeams.tr(),
          description: LocaleKeys.followTeamsHint.tr(),
          onPressed: () {
            BlocProvider.of<TeamsBloc>(context).countryId = null;
            BlocProvider.of<TeamsBloc>(context).tournamentId = null;
            BlocProvider.of<TeamsBloc>(context).name = null;
            BlocProvider.of<TeamsBloc>(context)..add(GetTeamsData());
            RouteManager.navigateTo(AllTeams());
          },
        ),
        Container(
          height: 157.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: teams.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(
                    width: 12.w,
                  ),
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (context) => di.getIt<FollowCubit>(),
                  child: GestureDetector(
                    onTap: () {


                      RouteManager.navigateTo(TeamProfile(
                        id: teams[index].id,
                        name: teams[index].name,
                        logo: teams[index].logo,
                        season: teams[index].season,
                        isFav: teams[index].isFavorites,
                        isFollowing: teams[index].isFollow,
                        countryFlag: teams[index].countryFlag,
                        countryName: teams[index].country,
                      ));
                    },
                    child: Container(
                      height: 157.h,
                      width: 130.w,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                teams[index].logo,
                                height: 52.h,
                                width: 52.w,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorApp.borderGray, width: .5)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 38.h,
                                ),
                                Container(
                                    width: 100.w,
                                    height: 15,
                                    child: Center(
                                        child: MainText(
                                      text: teams[index].name,
                                      font: 12,
                                      family: TextFontApp.semiBoldFont,
                                      overflow: TextOverflow.ellipsis,
                                    ))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20.w,
                                      height: 14.h,
                                      child: CachedImageNetwork(
                                        image: teams[index].countryFlag,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    MainText(
                                      text: teams[index].country,
                                      family: TextFontApp.regularFont,
                                      font: 10,
                                      color: ColorApp.hintGray,
                                    )
                                  ],
                                ),
                                Spacer(),
                                FollowButton(
                                  color: ColorApp.red,
                                  isFollow: teams[index].isFollow,
                                  id: teams[index].id,
                                  type: "team",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
