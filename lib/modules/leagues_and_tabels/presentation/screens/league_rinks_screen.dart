import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/table_bloc.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../widgets/league_rink_item.dart';

class LeagueRinksScreen extends StatelessWidget {
  const LeagueRinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<TableBloc>(context).table;
        print("stages result:$result");
        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState || state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      ),
                      itemCount: result.length,
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (_, c) => SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) {
                        print("leagueStage: ${result.length}");
                        return LeagueRinkItem(
                            leagueStageEntity: result[index]);
                      }),
                ),
              ],
            );
          }
        } else if (state is OfflineState) {
          return OfflinePage();
        } else {
          return Text("Server error");
        }
      },
    );
  }
}
