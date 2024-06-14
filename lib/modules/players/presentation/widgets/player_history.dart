import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/modules/players/presentation/bloc/history_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';

class PlayerHistory extends StatefulWidget {
  final int id;

  const PlayerHistory({
    super.key,
    required this.id,
  });

  @override
  State<PlayerHistory> createState() => _PlayerHistoryState();
}

class _PlayerHistoryState extends State<PlayerHistory> {
  @override
  void initState() {
    BlocProvider.of<PlayerHistoryBloc>(context)
      ..add(GetPlayerHistory(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder<PlayerHistoryBloc, BaseState>(
      builder: (context, state) {
        final playerHistory =
            BlocProvider.of<PlayerHistoryBloc>(context).playerHistory;
        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 25),
              itemCount: playerHistory!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              separatorBuilder: (_, c) => SizedBox(
                    height: 15,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: w * .05, right: w * .05, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: .5),
                      color: Colors.white),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            playerHistory[index].team.logo,
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: MainText(
                                  text: playerHistory[index].team.name,
                                  font: 14,
                                  family: TextFontApp.boldFont,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 23,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xffFDB302)),
                                alignment: Alignment.center,
                                child: MainText(
                                  text:playerHistory[index].position,
                                  font: 13,
                                  color: Colors.white,
                                  family: TextFontApp.semiBoldFont,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: MainText(
                                  text:
                                  "${playerHistory[index].joinDate ?? " "} >> ${playerHistory[index].leftDate ?? " "}",
                                  font: 12,
                                  color: Colors.black45,
                                  family: TextFontApp.semiBoldFont,
                                ),
                              )
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                );
              });
          ;
        } else if (state is OfflineState) {
          return OfflinePage();
        } else {
          return Text("Something Error");
        }
      },
    );
  }
}
