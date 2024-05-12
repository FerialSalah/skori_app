import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_card.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/following_event.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/player_follwing_bloc.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/empty.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/widgets/offline_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import '../../bloc/following_list/leagues_following_bloc.dart';
import '../favourites/fav_leagues.dart';
import '../favourites/fav_player_card.dart';

class FollowingLeaguesList extends StatefulWidget {
  FollowingLeaguesList({Key? key,}) : super(key: key);

  @override
  State<FollowingLeaguesList> createState() => _FollowingLeaguesListState();
}

class _FollowingLeaguesListState extends State<FollowingLeaguesList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<FollowingLeaguesBloc>(context)
          ..add(FollowingPlayersPagination());
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
    return BlocBuilder<FollowingLeaguesBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<FollowingLeaguesBloc>(context).followingLeagues;
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
                    itemBuilder: (context,index)=>LeagueCard(
                        id: result[index].id,
                        title: result[index].title,
                        isFollow: result[index].isFollow,
                        isFav: result[index].isFavorite,
                        logo: result[index].logo,
                        continent: result[index].continent),
                    separatorBuilder: (context,_)=>SizedBox(height:10.h,),
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
