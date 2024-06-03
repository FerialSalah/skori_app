import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/all_leagues.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/home/title_and_all.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../leagues_and_tabels/data/model/leagues_model.dart';
import '../../../../leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import '../../../../leagues_and_tabels/presentation/bloc/leagues_event.dart';
import '../../../../leagues_and_tabels/presentation/screens/league_table.dart';


class PopularLeagues extends StatelessWidget {
  final List<LeagueEntity> leagues;
  const PopularLeagues({Key? key, required this.leagues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndAll(
          title: LocaleKeys.popularLeagues.tr(),
          description: LocaleKeys.popularLeaguesHint.tr(),
          onPressed: (){
            BlocProvider.of<LeaguesBloc>(context).add(GetLeaguesData());
            RouteManager.navigateTo(AllLeaguesScreen());
          },
        ),

        Container(
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
                              height: 1.4,
                              center: true,),
                              SizedBox(height: 10.h,),
                              MainText(text: leagues[index].continent,
                                family: TextFontApp.regularFont,font: 10,color: ColorApp.hintGray,)


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
