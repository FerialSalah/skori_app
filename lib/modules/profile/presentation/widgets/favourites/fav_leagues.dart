import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/league_profile.dart';
import '../../../../../core/routes/navigator_push.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/favorite_button.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../leagues_and_tabels/presentation/screens/league_table.dart';

class FavLeagueCard extends StatelessWidget {
  final int id;
  final String title;
  final String logo;
  final String continent;
  final bool isFollow;
  final bool isFav;
  final String season;
  const FavLeagueCard({Key? key, required this.id, required this.title, required this.logo, required this.continent, required this.isFollow, required this.isFav, required this.season}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RouteManager.navigateTo(LeagueProfileScreen(
          id: id,
          name: title,
          logo:logo,
          continent: continent,
          isFollowing: isFollow,
          isFav:isFav,
          season: season,
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 24),
        height: 100.h,
        decoration:BoxDecoration(
          color: ColorApp.white,
          border:Border.all(color: ColorApp.borderGray,width: .3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(logo,height: 52.h,width: 40.w,),
            SizedBox(width: 15,),
            SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainText(text: title,family: TextFontApp.semiBoldFont,font: 14,),
                  MainText(text: continent,family: TextFontApp.regularFont,font: 12,color: ColorApp.hintGray,),
                ],
              ),
            ),
          Spacer(),
            FavoriteButton(isFavorite: isFav, id: id, type: 'tournament',),
          ],
        ),
      ),
    );
  }
}
