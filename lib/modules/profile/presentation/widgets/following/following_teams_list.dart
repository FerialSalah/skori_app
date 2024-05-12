import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/empty.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/widgets/offline_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import '../../bloc/following_list/following_event.dart';
import '../../bloc/following_list/team_following_bloc.dart';
import '../favourites/fav_team_card.dart';

class FollowingClubsList extends StatefulWidget {
  const FollowingClubsList({Key? key}) : super(key: key);

  @override
  State<FollowingClubsList> createState() => _FollowingClubsListState();
}

class _FollowingClubsListState extends State<FollowingClubsList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<FollowingTeamsBloc>(context)
          ..add(FollowingTeamsPagination());
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
    return BlocBuilder<FollowingTeamsBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<FollowingTeamsBloc>(context).followingTeams;
        if (state is LoadingState) {
          return ShimmerWidget();
        } else if (state is SuccessState ||state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            return Column(
              children: [
                Expanded(child:  ListView.separated(
                  controller: scrollController,
                    padding: EdgeInsets.symmetric(vertical:15 ),
                    itemBuilder: (context,index)=>FavTeamCard(
                      id: result[index].id,
                      name: result[index].name,
                      logo: result[index].logo,
                      country: result[index].country,
                      type: false,
                      countryFlag: result[index].countryFlag,
                      isFollow: result[index].isFollow,
                      isFav: result[index].isFavorites,
                    ),
                    separatorBuilder: (context,_)=>SizedBox(height:10,),
                    itemCount: result.length)),
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
    );

  }
}
