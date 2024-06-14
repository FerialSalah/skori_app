import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/generated/locale_keys.g.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';

TableRow leaguePerformanceTableHeader() {
  return TableRow(
    decoration: BoxDecoration(color: ColorApp.darkBlue),
    children: [
      Container(height: 50, child: Text('')),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: MainText(
                  text: LocaleKeys.performanceDate.tr(),
                  font: 12,
                  family: TextFontApp.semiBoldFont,
                  color: ColorApp.white,
                )),

            Center(
                child: MainText(
                  text: LocaleKeys.teams.tr(),
                  font: 12,
                  family: TextFontApp.semiBoldFont,
                  color: ColorApp.white,
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),

                child: MainText(
                  text: LocaleKeys.scores.tr(),
                  font: 12,
                  family: TextFontApp.semiBoldFont,
                  color: ColorApp.white,
                )),
          ],
        ),
      ),


    ],
  );
}
