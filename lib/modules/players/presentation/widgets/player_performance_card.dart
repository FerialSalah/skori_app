import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';
import 'package:skori/modules/players/presentation/widgets/player_performance_item.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';

class PlayerPerformanceCard extends StatelessWidget {
  final PlayerPerformanceEntity  playerPerformance;
  final String  title;
  const PlayerPerformanceCard({Key? key, required this.playerPerformance, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(

            text: title,font: 16,family: TextFontApp.boldFont,
          overflow: TextOverflow.clip,
          maxLines: 2,),
          SizedBox(height: 20,),
          Container(
           // height: 400.h,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            decoration: BoxDecoration(
                border: Border.all(color: ColorApp.borderGray,width: 1),
              color: ColorApp.white

            ),
            child: Column(
              children: [

                Container(

                  child: Column(
                    children: [
                      PlayerPerformanceItem(
                        playerPerformanceList: playerPerformance.passing!,
                        title: LocaleKeys.passing.tr(),

                      )
                    ],
                  )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.longPassing!,
                          title: LocaleKeys.longPass.tr(),

                        )
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.shortPassing!,
                          title: LocaleKeys.shortPass.tr(),

                        )
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.crosses!,
                          title: LocaleKeys.crosses.tr(),

                        )
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.crossOpenPlay!,
                          title: LocaleKeys.crossesOpenPlay.tr(),

                        )
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.crossSetPiece!,
                          title: LocaleKeys.crossesFromSetPieces.tr(),

                        )
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.dribble!,
                          title: LocaleKeys.dribble.tr(),

                        )
                      ],
                    )
                ),

                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.ballReceive!,
                          title: LocaleKeys.ballRecieve.tr(),

                        )
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        PlayerPerformanceItem(
                          playerPerformanceList: playerPerformance.attempts!,
                          title: LocaleKeys.attempt.tr(),

                        )
                      ],
                    )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
