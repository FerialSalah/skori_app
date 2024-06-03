import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../widgets/league_card.dart';


class AllLeaguesScreen extends StatefulWidget {
  const AllLeaguesScreen({Key? key}) : super(key: key);

  @override
  State<AllLeaguesScreen> createState() => _AllLeaguesScreenState();
}

class _AllLeaguesScreenState extends State<AllLeaguesScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<LeaguesBloc>(context)
          ..add(LeaguesPagination());
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
    return Scaffold(
        appBar: AppBars.appBarTitle(title: LocaleKeys.leagues.tr(),search: true),

        body: BlocBuilder<LeaguesBloc, BaseState>(
          builder: (context, state) {
            final result = BlocProvider.of<LeaguesBloc>(context).leagues;
            if (state is LoadingState) {
              return ShimmerWidget();
            } else if (state is SuccessState ||state is PaginateState) {
              if (result.isEmpty) {
                return emptyShow();
              } else {
                return Column(
                  children: [
                    Expanded(
                      child:    ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                          itemBuilder: (context,index)=>LeagueCard(
                            id: result[index].id,
                            title:result[index].title,
                            logo:result[index].logo ,
                            isFollow:result[index].isFollow ,
                            isFav:result[index].isFavorite ,
                            continent:result[index].continent ,
                          ),
                          separatorBuilder: (context,_)=>SizedBox(
                            height: 10,
                          ),
                          itemCount: result.length),),
                    if(state is PaginateState)
                      ColorLoader(),
                    SizedBox(height: 50,),
                  ],
                );
              }
            } else if (state is OfflineState) {
              return OfflinePage();
            } else {
              return Text("Server error");
            }
          },
        )

    );
  }
}
