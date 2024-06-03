import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/home/title_and_all.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/presentation/screens/all_players.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/cubit/follow_cubit.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/follow_button.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../players/presentation/bloc/players_bloc.dart';
import '../../../../players/presentation/bloc/players_event.dart';
import '../../../../players/presentation/screens/player_profile.dart';
import '../../../../../core/injection/injection_app.dart' as di;

class FollowPlayers extends StatelessWidget {
  final List<PlayerEntity> players;
  const FollowPlayers({Key? key, required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndAll(
          title: LocaleKeys.followPlayers.tr(),
          description: LocaleKeys.followPlayersHint.tr(),
          onPressed: () {
            BlocProvider.of<PlayersBloc>(context).countryId = null;
            BlocProvider.of<PlayersBloc>(context).teamId = null;
            BlocProvider.of<PlayersBloc>(context).playerName = null;
            BlocProvider.of<PlayersBloc>(context)..add(GetPlayersData());
            RouteManager.navigateTo(AllPlayers());
          },
        ),
        Container(
          height: 267.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              itemCount: 5,
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
                      RouteManager.navigateTo(PlayerProfile(
                        id: players[index].id,
                        name: players[index].name,
                        avatar: players[index].avatar,
                        clubName: players[index].teamEntity!.name,
                        clubLogo: players[index].teamEntity!.logo,
                        isFollow: players[index].isFollow,
                        isFav: players[index].isFavourite,
                      ));
                    },
                    child: Container(
                      width: 150.w,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 130.h,
                                // decoration: BoxDecoration(
                                //     color: Color(0xffFEF1F4)
                                // ),
                                child: CachedImageNetwork(
                                  image: players[index].avatar,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 113.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 32.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                          AppImages.shirt,
                                        ),
                                      )),
                                      child: Center(
                                          child: MainText(
                                        text: players[index].clubShirtNumber,
                                        font: 12,
                                        family: TextFontApp.extraBoldFont,
                                        color: ColorApp.white,
                                      )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Container(
                              width: 120.w,
                              child: MainText(
                                text: players[index].name,
                                font: 14,
                                family: TextFontApp.semiBoldFont,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              )),
                          SizedBox(
                            height: 12.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  players[index].teamEntity!.logo,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: MainText(
                                    text: players[index].teamEntity!.name,
                                    font: 12,
                                    overflow: TextOverflow.clip,
                                    center: true,
                                    family: TextFontApp.extraBoldFont,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          FollowButton(
                            color: ColorApp.yellow,
                            isFollow: players[index].isFollow,
                            id: players[index].id,
                            type: "player",
                          ),
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
