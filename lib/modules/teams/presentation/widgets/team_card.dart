import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/teams/presentation/screens/team_profile.dart';
import '../../../../core/cubit/follow_cubit.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/follow_button.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/injection/injection_app.dart' as di;

class TeamCard extends StatelessWidget {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String season;
  final String countryFlag;
  final bool isFollow;
  final bool isFav;
  const TeamCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.country,
      required this.logo,
      required this.countryFlag,
      required this.isFollow,
      required this.isFav,
      required this.season})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<FollowCubit>(),
      child: GestureDetector(
        onTap: () {
          RouteManager.navigateTo(TeamProfile(
              id: id,
              name: name,
              logo: logo,
              isFav: isFav,
              season: season,
              isFollowing: isFollow,
              countryFlag: countryFlag,
              countryName: country));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          color: ColorApp.white,
          child: Row(
            children: [
              // Image.network(logo,width: 40.w,height: 70.h,),

              SizedBox(
                width: 40.w,
                height: 70.h,
                child: CachedImageNetwork(
                  image: logo,
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120.w,
                    child: MainText(
                      text: name,
                      font: 14,
                      family: TextFontApp.semiBoldFont,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      // Image.network(countryFlag,height: 14.h,width: 20.w,),
                      Container(
                        width: 20.w,
                        height: 14.h,
                        child: CachedImageNetwork(
                          image: countryFlag,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MainText(
                        text: country,
                        font: 12,
                        family: TextFontApp.regularFont,
                        color: ColorApp.hintGray,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              FollowButton(
                id: id,
                type: "team",
                color: ColorApp.red,
                isFollow: isFollow,
                width: 110.w,
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
