import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/modules/authentication/presentation/screens/login_screen.dart';
import 'package:skori/modules/nav_bar/data/model/matches_model.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/routes/navigator_push.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../matches/presentation/screens/statistics_screen.dart';

class LiveMatchesSlider extends StatelessWidget {
   final List<MatchEntity> matches;
  const LiveMatchesSlider({Key? key, required this.matches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Theeeee Length=====${matches.length}");
    return  matches.isEmpty?SizedBox():Column(
      children: [
        SizedBox(height:  17.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainText(text: LocaleKeys.liveMatches.tr(),font: 16,family: TextFontApp.extraBoldFont,),
            ],
          ),
        ),
        SizedBox(height:  15.h,),
       Container(
          child: CarouselSlider.builder(
            itemCount: matches.length,
            options: CarouselOptions(
                autoPlay: true,
                height: 160.h,
                aspectRatio: 2.5,
                viewportFraction: .9,
                enlargeFactor:.25,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (index, reason) {

                }
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex)=> GestureDetector(
              onTap: (){
                if(AppStorage.isLogged){
                  RouteManager.navigateTo(StatisticsScreen(
                    id: matches[itemIndex].id,
                    title: matches[itemIndex].season,
                    type: matches[itemIndex].type,
                    watchLink:matches[itemIndex].watchLink,
                    homeTeamName: matches[itemIndex].homeTeamName,
                    homeTeamScore: matches[itemIndex].homeTeamScore,
                    homeTeamLogo: matches[itemIndex].homeTeamLogo,
                    awayTeamName: matches[itemIndex].awayTeamName,
                    awayTeamScore: matches[itemIndex].awayTeamScore,
                    stadium: matches[itemIndex].stadium,
                    awayTeamLogo: matches[itemIndex].awayTeamLogo,
                    logo: matches[itemIndex].logo,
                    time: matches[itemIndex].time,
                    date: matches[itemIndex].date,
                    currentTime: matches[itemIndex].currentTime,
                    homeTeamId: matches[itemIndex].homeTeamId,
                    awayTeamId: matches[itemIndex].awayTeamId,
                  ));

                }else{
                  RouteManager.navigateTo(LoginScreen());
                }

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                // color: Colors.black,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.matchBg),
                    fit: BoxFit.cover
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(matches[itemIndex].homeTeamLogo,height: 40.h,width:20.w,),
                        SizedBox(height: 5.h,),
                        SizedBox(
                            width: 60,
                            child: Center(
                              child: MainText(text: matches[itemIndex].homeTeamName,font: 12,
                                family: TextFontApp.mediumFont,color: ColorApp.white,
                                center: true,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(width: 10.w,),
                    MainText(text: matches[itemIndex].homeTeamScore,font: 25,family: TextFontApp.boldFont,color: ColorApp.yellow,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 35.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainText(text: matches[itemIndex].time,font: 16,family: TextFontApp.boldFont,color: ColorApp.white,),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 18.h),
                            child: Image.network(matches[itemIndex].logo,height: 24.h,width: 24.w,),
                          ),
                          Container(
                            height: 24.h,
                            width: 48.w,
                            color: ColorApp.red,
                            child: Center(child: MainText(text: matches[itemIndex].currentTime,font: 10,family: TextFontApp.regularFont,color: ColorApp.white,)),
                          ),
                        ],
                      ),
                    ),
                    MainText(text: matches[itemIndex].awayTeamScore,font: 25,family: TextFontApp.boldFont,color: ColorApp.yellow,),
                    SizedBox(width: 20.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(matches[itemIndex].awayTeamLogo,height: 40.h,width: 24.w,),
                        SizedBox(height: 10.h,),
                        SizedBox(
                            width: 60,
                            child: Center(
                              child: MainText(text: matches[itemIndex].awayTeamName,font: 12,
                                family: TextFontApp.mediumFont,color: ColorApp.white,
                                center: true,
                                ),
                            ))
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
