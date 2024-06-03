import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/teams/presentation/bloc/team_bloc.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import 'package:skori/modules/teams/presentation/widgets/team_filter_sheet.dart';
import '../../../../core/widgets/app_bar/app_bar_with_filter.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../Widgets/team_card.dart';

class AllTeams extends StatefulWidget {
  const AllTeams({Key? key}) : super(key: key);

  @override
  State<AllTeams> createState() => _AllTeamsState();
}

class _AllTeamsState extends State<AllTeams> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("here all teams");
        await BlocProvider.of<TeamsBloc>(context)
          ..add(TeamsPagination());
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
            title: LocaleKeys.allTeams.tr(),
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
                      child: TeamFilterSheet(),
                    );
                  });
            }),
        body: BlocBuilder<TeamsBloc, BaseState>(
          builder: (context, state) {
            final result = BlocProvider.of<TeamsBloc>(context).teams;
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
                                top: 10,
                                bottom: 10),
                            itemBuilder: (context, index) => TeamCard(
                                  id: result[index].id,
                                  name: result[index].name,
                                  logo: result[index].logo,
                                  season: result[index].season,
                                  country: result[index].country,
                                  countryFlag: result[index].countryFlag,
                                  isFollow: result[index].isFollow,
                                  isFav: result[index].isFavorites,
                                ),
                            separatorBuilder: (context, _) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: result.length)),
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
