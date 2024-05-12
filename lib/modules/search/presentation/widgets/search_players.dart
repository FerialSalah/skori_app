import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/follow_button.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../core/cubit/follow_cubit.dart';
import '../../../../core/injection/injection_app.dart' as di;
import '../../../../core/routes/navigator_push.dart';
import '../../../players/presentation/screens/player_profile.dart';

class SearchPlayers extends StatelessWidget {
  final List<PlayerEntity> players;
  const SearchPlayers({Key? key, required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          itemCount: players.length,
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
                  RouteManager.navigateTo(PlayerProfile(id:players[index].id, name: players[index].name,
                    avatar: players[index].avatar, clubLogo: players[index].teamEntity.logo, clubName:players[index].teamEntity.name ,
                    isFollow: players[index].isFollow, isFav: players[index].isFavourite,
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
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            players[index].teamEntity.logo,
                            width: 20,
                            height: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 100,
                            child: MainText(
                              text: players[index].teamEntity.name,
                              font: 12,
                              overflow: TextOverflow.ellipsis,
                              family: TextFontApp.extraBoldFont,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FollowButton(
                        color: ColorApp.yellow,
                        id: players[index].id,
                        type: "player",
                        isFollow: players[index].isFollow,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
