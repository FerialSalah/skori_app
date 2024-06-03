import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';

class PlayerNewStatisticCard extends StatelessWidget {
  final List<StatisticAbsoluteValue> statistics;
  final String title;
  const PlayerNewStatisticCard(
      {Key? key, required this.statistics, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(text: title, font: 18, family: TextFontApp.boldFont),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                border: Border.all(color: ColorApp.borderGray, width: 1),
                color: ColorApp.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MainText(
                            text: LocaleKeys.parameter.tr(),
                            font: 16,
                            family: TextFontApp.boldFont),
                      ],
                    ),
                    Spacer(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       MainText(
                         text: LocaleKeys.absolute.tr(),
                         font: 13,
                         family: TextFontApp.boldFont,
                       ),

                       SizedBox(
                         width: 5,
                       ),
                       MainText(
                         text: LocaleKeys.per90.tr(),

                         font: 13,
                         family: TextFontApp.boldFont,
                       ),
                     ],
                   )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  child: ListView.separated(
                      shrinkWrap: true,
                    //  physics: NeverScrollableScrollPhysics(),
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        print("value is : ${statistics[index].per90Value}");
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Row(
                             children: [
                               SizedBox(
                                 width: 155.w,
                                 child: MainText(
                                   text: "${statistics[index].name}",
                                   font: 13,
                                   family: TextFontApp.semiBoldFont,
                                   overflow: TextOverflow.clip,
                                 ),
                               ),
                             ],
                           ),
                            Spacer(),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               statistics[index].absoluteValue=="premium"?SizedBox(
                                 width:70.w,
                                   child: Image.asset(AppIcons.premium,height: 30,width: 30,)):
                               SizedBox(
                                 width:70.w,
                                 child: MainText(
                                     text: "${statistics[index].absoluteValue.toString()}",
                                     font: 16,
                                     family: TextFontApp.mediumFont,
                                     hor: 20,
                                     color: Colors.black,

                                     center:true),
                               ),

                               statistics[index].absoluteValue=="premium"?SizedBox(
                                 width:70.w,
                                   child: Image.asset(AppIcons.premium,height: 30,width: 30,)):
                               SizedBox(
                                 width:70.w,
                                 child: MainText(

                                     text: "${statistics[index].per90Value}",
                                     font: 16,
                                     family: TextFontApp.mediumFont,
                                     hor: 20,
                                     color: Colors.black,
                                   center: true,
                                 ),
                               ),
                               // SizedBox(
                               //   width:  statistics[index].absoluteValue=="premium"? 15:5,
                               // ),
                             ],
                           )
                          ],
                        );
                      },
                      separatorBuilder: (_, c) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(),
                          ),
                      itemCount: statistics.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
