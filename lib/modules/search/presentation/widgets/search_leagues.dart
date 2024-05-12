import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/button/follow_button.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../leagues_and_tabels/presentation/screens/league_table.dart';

class SearchLeagues extends StatelessWidget {
  final   List<LeagueEntity> leagues;
  const SearchLeagues({Key? key, required this.leagues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 155.h,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          itemCount: leagues.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context,_)=>SizedBox(width:12.w ,),
          itemBuilder: (context,index){
            return   Container(
              height: 138.h,
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: leagues.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context,_)=>SizedBox(width:12.w ,),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        RouteManager.navigateTo(LeagueTableScreen(
                          id: leagues[index].id,
                          name: leagues[index].title,
                          isFollowing: leagues[index].isFollow,
                          isFav: leagues[index].isFavorite,
                          logo: leagues[index].logo,
                          continent: leagues[index].continent,
                        ));
                      },
                      child: Container(
                        height:108.h,
                        width: 130.w,
                        child:   Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(leagues[index].logo,height: 52.h,width: 52.w,),
                              ],
                            ),
                            Container(
                              width: 130.w,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              margin: EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                  border:Border.all(color: ColorApp.borderGray,width: .5)
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 38.h,),
                                  MainText(text: leagues[index].title,font: 14,family: TextFontApp.semiBoldFont,
                                    center: true,),
                                  SizedBox(height: 10.h,),
                                  MainText(text: leagues[index].continent,family: TextFontApp.regularFont,font: 10,color: ColorApp.hintGray,)


                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
