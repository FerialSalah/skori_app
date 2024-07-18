import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/players/presentation/bloc/players_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import 'package:skori/modules/players/presentation/widgets/player_filter_sheet.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/app_bar/app_bar_with_filter.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../Widgets/player_card.dart';

class AllPlayers extends StatefulWidget {
  const AllPlayers({Key? key}) : super(key: key);

  @override
  State<AllPlayers> createState() => _AllPlayersState();
}

class _AllPlayersState extends State<AllPlayers> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<PlayersBloc>(context)
          ..add(PlayersPagination());
      }
    });
    super.initState();
    // scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarsWithFilter.appBarTitle(
            title: LocaleKeys.allPlayers.tr(),
            search: true,
            filter: true,
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: PlayerFilterSheet(),
                    );
                  });
            }),
        body: BlocBuilder<PlayersBloc, BaseState>(
          builder: (context, state) {
            final result = BlocProvider.of<PlayersBloc>(context).players;
            if (state is LoadingState) {
              return ShimmerWidget();
            } else if (state is SuccessState || state is PaginateState) {
              if (result.isEmpty) {
                return emptyShow();
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .05,
                              right: MediaQuery.of(context).size.width * .05,
                              top: 20),
                          itemBuilder: (context, index) => PlayerCard(
                                id: result[index].id,
                                avatar: result[index].avatar,
                                name: result[index].name,
                                clubName: result[index].teamEntity!=null? result[index].teamEntity!.name:"",
                                clubLogo: result[index].teamEntity!=null? result[index].teamEntity!.logo:"",
                                position: result[index].position,
                                isFollow: result[index].isFollow,
                                isFavorite: result[index].isFavourite,
                                number: result[index].clubShirtNumber,

                              ),
                          separatorBuilder: (context, _) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount: result.length),
                    ),
                    if (state is PaginateState) ColorLoader(),
                    SizedBox(
                      height: 50,
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
        ));
  }
}
