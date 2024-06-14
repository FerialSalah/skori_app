import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/league_table.dart';

import '../../../../core/widgets/main_text.dart';

class LeagueRinkItem extends StatelessWidget {
  final LeagueStageEntity leagueStageEntity;
  const LeagueRinkItem({super.key, required this.leagueStageEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            //height: 20,
            child: MainText(
              text:
              //LocaleKeys.rink.tr()
                   leagueStageEntity.title.toString() ,
              font: 18,
              family: TextFontApp.boldFont,
            ),
          ),
          LeagueTableScreen(
            tables: leagueStageEntity.ranks!,
          ),
        ],
      ),
    );
  }
}
