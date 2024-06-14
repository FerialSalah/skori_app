import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../news/presentation/widgets/news_card.dart';
import '../bloc/league_news_bloc.dart';

class LeagueNews extends StatefulWidget {
  final int leagueId;
  const LeagueNews({
    super.key,
    required this.leagueId,
  });

  @override
  State<LeagueNews> createState() => _LeagueNewsState();
}

class _LeagueNewsState extends State<LeagueNews> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("leagues Pagination");
        await BlocProvider.of<LeagueNewsBloc>(context)
          ..add(LeagueNewsPagination(id: widget.leagueId));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .025,
        right: MediaQuery.of(context).size.width * .025,
      ),
      child: BlocBuilder<LeagueNewsBloc, BaseState>(
        builder: (context, state) {
          final leagueNews =
              BlocProvider.of<LeagueNewsBloc>(context).leagueNews;
          if (state is LoadingState) {
            return ColorLoader();
          } else if (state is SuccessState ||state is PaginateState) {
            if (leagueNews.isEmpty) {
              return emptyShow();
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      // physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                        itemCount: leagueNews.length,
                        shrinkWrap: true,
                        primary: false,
                        controller: scrollController,
                        separatorBuilder: (_, c) =>
                            SizedBox(
                              height: 15,
                            ),
                        itemBuilder: (context, index) {
                          return NewsCart(
                            newsEntity: leagueNews[index],
                            isPlayer: false,
                            isTeam: false,
                          );
                        }),
                  ),
                  if(state is PaginateState)
                    ColorLoader(),
                  SizedBox(height: 50,),
                ],
              );
            }
          } else if (state is OfflineState) {
            return OfflinePage();
          } else {
            return Text("Something Error");
          }
        },
      ),
    );
  }
}
