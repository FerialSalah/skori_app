import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/modules/players/domain/entity/player_statistics_entity.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';

class PlayerPerformanceItem extends StatelessWidget {
  const PlayerPerformanceItem(
      {Key? key, required this.playerPerformanceList, required this.title})
      : super(key: key);

  final List<StatisticValue> playerPerformanceList;
  final String title;

  @override
  Widget build(BuildContext context) {
    print("value performance: ${playerPerformanceList[4].name}");
    print("value performance: ${playerPerformanceList[4].value.toString()}");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText(text: title, font: 18, family: TextFontApp.boldFont),
              MainText(
                text: playerPerformanceList[4].value.toString().contains("%")? playerPerformanceList[4].value.toString():
                playerPerformanceList[4].value.toString()+" %",
                font: 18,
                family: TextFontApp.boldFont,
                color: ColorApp.darkBlue,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 110.h,

            padding: EdgeInsets.symmetric(horizontal:3, vertical:15),
            child: Column(
              children: [
                Container(

                  height: 130.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Row(
                           children: [
                             playerPerformanceList[0].value == "premium"
                                 ? Image.asset(
                               AppIcons.premium,
                               height: 24,
                               width: 24,
                             )
                                 : MainText(
                                 text:
                                 playerPerformanceList[0].value.toString(),
                                 font: 14,
                                 family: TextFontApp.mediumFont),
                             IconButton(onPressed:(){
                               print(playerPerformanceList[0].name);
                             }, icon: Image.asset(ProfileIcons.information,width: 20.w,height: 20.h,),tooltip: playerPerformanceList[0].name,)
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           //crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             playerPerformanceList[1].value == "premium"
                                 ? Image.asset(
                               AppIcons.premium,
                               height: 24,
                               width: 24,
                             )
                                 : MainText(
                                 text:
                                 playerPerformanceList[1].value.toString(),
                                 font: 14,
                                 family: TextFontApp.mediumFont),
                             IconButton(onPressed:(){
                               print(playerPerformanceList[1].name);
                             }, icon: Image.asset(ProfileIcons.information,width: 20.w,height: 20.h,),tooltip: playerPerformanceList[1].name,)
                           ],
                         )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      new LinearPercentIndicator(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                        //width: 300.w,
                        lineHeight: 13.0,
                        percent:
                            playerPerformanceList[4].value.toString() != "0 %" &&
                                playerPerformanceList[4].value.toString() != "0"&&
                          playerPerformanceList[4].value.toString() != "premium"&&
                                playerPerformanceList[4]
                                .value.toString().isNotEmpty
                                ? double.parse(playerPerformanceList[4]
                                        .value
                                        .toString()
                                        .substring(0,playerPerformanceList[4].value.toString().indexOf("%") )) /
                                    100
                                : 0.0,

                        progressColor: ColorApp.darkBlue,
                        backgroundColor: ColorApp.borderGray,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           playerPerformanceList[2].value == "premium"
                               ? Image.asset(
                             AppIcons.premium,
                             height: 24,
                             width: 24,
                           )
                               : MainText(
                               text:
                               playerPerformanceList[2].value.toString(),
                               font: 14,
                               family: TextFontApp.mediumFont),
                           IconButton(onPressed:(){
                             print(playerPerformanceList[1].name);
                           }, icon: Image.asset(ProfileIcons.information,width: 20.w,height: 20.h,),tooltip: playerPerformanceList[3].name,),

                         ],
                       ),
                       Row(
                         children: [
                           playerPerformanceList[3].value == "premium"
                               ? Image.asset(
                             AppIcons.premium,
                             height: 24,
                             width: 24,
                           )
                               : MainText(
                               text:
                               playerPerformanceList[3].value.toString(),
                               font: 14,
                               family: TextFontApp.mediumFont),
                           IconButton(onPressed:(){
                             print(playerPerformanceList[4].name);
                           }, icon: Image.asset(ProfileIcons.information,width: 20.w,height: 20.h,),tooltip: playerPerformanceList[4].name,),
                         ],
                       )
                     ],
                   )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
