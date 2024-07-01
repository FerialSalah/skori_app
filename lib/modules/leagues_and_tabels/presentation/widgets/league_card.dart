import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/widgets/button/follow_button.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/league_profile.dart';
import '../../../../core/cubit/follow_cubit.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../screens/league_table.dart';
import '../../../../core/injection/injection_app.dart' as di;

class LeagueCard extends StatelessWidget {
  final int id;
  final String title;
  final String logo;
  final String continent;
  final String season;
  final bool isFollow;
  final bool isFav;
  const LeagueCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.logo,
      required this.continent,
      required this.isFollow,
      required this.isFav,
      required this.season})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isFollow);
    return BlocProvider(
      create: (context) => di.getIt<FollowCubit>(),
      child: GestureDetector(
        onTap: () {
          RouteManager.navigateTo(LeagueProfileScreen(
              id: id,
              logo: logo,
              name: title,
              continent: continent,
              isFollowing: isFollow,
              isFav: isFav,
              season: season));
          //     LeagueTableScreen(
          //   id: id,
          //   name: title,
          //   logo: logo,
          //   isFav: isFav,
          //   continent: continent,
          //   isFollowing: isFollow,
          // ));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
         // height: 150.h,
          decoration: BoxDecoration(
            color: ColorApp.white,
            border: Border.all(color: ColorApp.borderGray, width: .3),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                logo,
                height: 80.h,
                width: 80.w,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainText(
                    text: title,
                    family: TextFontApp.semiBoldFont,
                    font: 14,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MainText(
                    text: continent,
                    family: TextFontApp.regularFont,
                    font: 12,
                    color: ColorApp.hintGray,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FollowButton(
                    id: id,
                    type: "tournament",
                    color: ColorApp.yellow,
                    isFollow: isFollow,
                    width: 120.w,
                    height: 30,
                  )
                ],
              ),
             // Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
