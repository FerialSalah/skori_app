import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';

import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/favorite_button.dart';
import '../../../../core/widgets/button/follow_button.dart';
import '../../../../core/widgets/main_text.dart';

class LeagueAppBar extends StatelessWidget {
  final String logo;
  final String name;
  final String? continent;
  final bool isFollowing;
  final bool isFav;
  final int id;

  const LeagueAppBar(
      {Key? key,
      required this.logo,
      required this.name,
      this.continent,required this.isFollowing,required this.id, required this.isFav,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: ColorApp.primary,
      leadingWidth: 60,
      toolbarHeight: 50,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            RouteManager.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorApp.white,
          )),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              FollowButton(
                color: ColorApp.white.withOpacity(.20),
                isFollow: isFollowing,
                id: id,
                type: "tournament",
                 width: 77.w,
                height: 30.h,
              ),

              SizedBox(
                width: 6,
              ),
              !AppStorage.isLogged?SizedBox():Container(
                padding: EdgeInsets.all(5),
                height: 30.h,
                width: 30.w,
                color: ColorApp.white.withOpacity(.15),
                child: FavoriteButton(
                  id: id,
                  type: "tournament",
                  isFavorite:isFav ,
                ),
              )
            ],
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.2,
       centerTitle: true,
       collapseMode: CollapseMode.pin,
        background:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
            ),
            SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.network(
                  logo,
                  height: 82.h,
                  width: 65.w,
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 10.h,
            ),

            MainText(
              text: continent,
              color: ColorApp.white,
              font: 12,
              family: TextFontApp.regularFont,
            ),
            SizedBox(
              height: 10.h,
            ),
            MainText(
              text: name,
              color: Colors.white,
              family: TextFontApp.semiBoldFont,
              font: 16,
            ),

          ],
        ) ,

      ),
    );
  }
}
