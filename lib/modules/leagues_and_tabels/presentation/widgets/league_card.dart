import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/widgets/button/follow_button.dart';
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
  final bool isFollow;
  final bool isFav;
  const LeagueCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.logo,
      required this.continent,
      required this.isFollow,
      required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<FollowCubit>(),
      child: GestureDetector(
        onTap: () {
          RouteManager.navigateTo(LeagueTableScreen(
            id: id,
            name: title,
            logo: logo,
            isFav: isFav,
            continent: continent,
            isFollowing: isFollow,
          ));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
          height: 100.h,
          decoration: BoxDecoration(
            color: ColorApp.white,
            border: Border.all(color: ColorApp.borderGray, width: .3),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                logo,
                height: 52.h,
                width: 40.w,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainText(
                    text: title,
                    family: TextFontApp.semiBoldFont,
                    font: 14,
                  ),
                  MainText(
                    text: continent,
                    family: TextFontApp.regularFont,
                    font: 12,
                    color: ColorApp.hintGray,
                  ),
                ],
              ),
              Spacer(),
              FollowButton(
                id: id,
                type: "tournament",
                color: ColorApp.yellow,
                isFollow: isFollow,
                width: 80.w,
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
