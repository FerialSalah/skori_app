import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/constants.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/button/favorite_button.dart';
import 'package:skori/modules/players/presentation/screens/player_profile.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/favorite_cubit.dart';
import '../../../../core/cubit/follow_cubit.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/follow_button.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/injection/injection_app.dart' as di;
import '../bloc/player_statistics_bloc.dart';

class PlayerCard extends StatelessWidget {
  final int id;
  final String avatar;
  final String name;
  final String position;
  final String clubLogo;
  final String clubName;
  final bool isFollow;
  final bool isFavorite;
  final String number;

  const PlayerCard(
      {Key? key,
      required this.avatar,
      required this.name,
      required this.position,
      required this.isFollow,
      required this.id,
      required this.isFavorite,
      required this.number,
      required this.clubLogo,
      required this.clubName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
   providers: [
     BlocProvider(create: (context) => di.getIt<FollowCubit>()),
     BlocProvider(create: (context) => di.getIt<FavoriteCubit>()),


   ],
  child: GestureDetector(
      onTap: () {
        BlocProvider.of<PlayerStatisticsBloc>(context).tournamentId = null;
        BlocProvider.of<PlayerStatisticsBloc>(context).seasonId = null;

        RouteManager.navigateTo(PlayerProfile(
          id: id,
          name: name,
          avatar: avatar,
          clubLogo: clubLogo,
          clubName: clubName,
          isFav: isFavorite,
          isFollow: isFollow,
        ));
      },
      child: Container(
        height: 130.h,
        child: Stack(
          children: [
            Container(
              height: 115.h,
              color: ColorApp.white,
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 115.h,
                        width: 130.w,
                        // color: Colors.red,
                        child: CachedImageNetwork(
                          image: avatar,
                        ),

                      ),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: FavoriteButton(isFavorite: isFavorite,id: id,type: "player",))
                    ],
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 170.w,
                          child: MainText(
                            text: name,
                            font: 14,
                            family: TextFontApp.boldFont,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          )),
                      MainText(
                        text: position,
                        font: 13,
                        family: TextFontApp.regularFont,
                        color: ColorApp.hintGray,
                      ),
                      FollowButton(id: id, type: "player", color: ColorApp.yellow, isFollow: isFollow,width: 80.w,height: 30,)
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 1,
                left: isEn ? 40 : 0,
                right: isEn ? 0 : 40,
                child: Stack(
                  children: [
                    Container(
                      height: 30.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          AppImages.shirt,
                        ),
                      )),
                      child: Center(
                          child: MainText(
                        text: number,
                        font: 12,
                        family: TextFontApp.extraBoldFont,
                        color: ColorApp.white,
                      )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ),
);
  }
}
