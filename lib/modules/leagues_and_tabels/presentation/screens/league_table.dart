import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/table_bloc.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../widgets/league_app_bar.dart';
import '../widgets/league_table_header.dart';
import '../widgets/league_table_row.dart';
import '../../../../core/injection/injection_app.dart' as di;

class LeagueTableScreen extends StatelessWidget {
  // final int id;
  // final String logo;
  // final String name;
  // final String continent;
  // final bool isFollowing;
  // final bool isFav;
  final List<TableEntity> tables;
  const LeagueTableScreen(
      {Key? key, required this.tables,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Container(
       // height: 400,
        child: Table(
            columnWidths: {
              0: FlexColumnWidth(.8),
              1: FlexColumnWidth(2.8),
              2: FlexColumnWidth(.7),
              3: FlexColumnWidth(.7),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(.9),
              6: FlexColumnWidth(1.3),
              7: FlexColumnWidth(.7),
              8:FlexColumnWidth(1.2)
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            // border: TableBorder.all(color: Colors.black),
            border: TableBorder(
                horizontalInside:
                BorderSide(color: ColorApp.borderGray, width: .5),
                top: BorderSide(color: ColorApp.borderGray, width: .5),
                bottom:
                BorderSide(color: ColorApp.borderGray, width: .5),
                right:
                BorderSide(color: ColorApp.borderGray, width: .5),
                left: BorderSide(color: ColorApp.borderGray, width: .5)
              // outside: BorderSide(color: ColorApp.borderGray,width: .5)
            ),
            children: [
              leagueTableHeader(),
              ...tables.asMap().entries.map((e){
                return
                  leagueTableRow(
                  id: e.value.id!,
                  logo: e.value.logo!,
                  name: e.value.name!,
                  index: e.key+1,
                  pts: e.value.pointsNo!,
                  win: e.value.winMatchesNo!,
                  lose: e.value.loseMatchesNo!,
                  draw: e.value.drawMatchesNo!,
                  matchesNum: e.value.matchesNo!,
                  scoreGoal: e.value.scoreGoalsNo!,
                  reverseGoal: e.value.reverseGoalsNo!,
                  differentGoal: e.value.differentGoalsNo!,


                );
              }).toList(),

            ]),
      ),
    );


  }
}
