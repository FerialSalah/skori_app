import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/table_bloc.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../widgets/league_app_bar.dart';
import '../widgets/league_table_header.dart';
import '../widgets/league_table_row.dart';
import '../../../../core/injection/injection_app.dart' as di;

class LeagueTableScreen extends StatelessWidget {
  final int id;
  final String logo;
  final String name;
  final String continent;
  final bool isFollowing;
  final bool isFav;
  const LeagueTableScreen(
      {Key? key,
      required this.logo,
      required this.name,
      required this.continent,
      required this.id, required this.isFollowing, required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<TableBloc>()..add(GetTableData(id: id)),
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) =>[
              LeagueAppBar(
                name: name,
                logo: logo,
                continent: continent,
                isFollowing: isFollowing,
                isFav:isFav ,
                id: id,
              ),
            ],
            body:  BlocBuilder<TableBloc, BaseState>(
              builder: (context, state) {
                final result = BlocProvider.of<TableBloc>(context).table;
                if (state is LoadingState) {
                  return ColorLoader();
                } else if (state is SuccessState ||state is PaginateState) {
                  if (result.isEmpty) {
                    return emptyShow();
                  } else {
                    return SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                        child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(.8),
                              1: FlexColumnWidth(3.4),
                              2: FlexColumnWidth(.8),
                              3: FlexColumnWidth(.8),
                              4: FlexColumnWidth(.8),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                              7: FlexColumnWidth(.8),
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

                              ...result.asMap().entries.map((e){
                                return  leagueTableRow(
                                  id: e.value.id,
                                  logo: e.value.logo,
                                  name: e.value.name,
                                  index: e.key+1,
                                  pts: e.value.points,
                                  win: e.value.win,
                                  lose: e.value.lose,
                                  draw: e.value.draw,
                                  matchesNum: e.value.matchesNum,
                                  scoreGoal: e.value.scoreGoal,
                                  reverseGoal: e.value.reverseGoal,
                                  differentGoal: e.value.differentGoal,
                                  isFav: e.value.isFavorite,
                                  isFollowing: e.value.isFavorite,
                                  countryFlag: e.value.countryFlag,
                                  countryName: e.value.countryName,

                                );
                              }).toList(),

                            ]),
                      ),
                    );
                  }
                } else if (state is OfflineState) {
                  return OfflinePage();
                } else {
                  return Text("Server error");
                }

              },
            )
          )
         ),
    );
  }
}
