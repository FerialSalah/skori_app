import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/following_event.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/player_follwing_bloc.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/empty.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/widgets/offline_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import '../favourites/fav_player_card.dart';

class FollowingPlayersList extends StatefulWidget {
   FollowingPlayersList({Key? key,}) : super(key: key);

  @override
  State<FollowingPlayersList> createState() => _FollowingPlayersListState();
}

class _FollowingPlayersListState extends State<FollowingPlayersList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<FollowingPlayersBloc>(context)
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
    return BlocBuilder<FollowingPlayersBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<FollowingPlayersBloc>(context).followingPlayers;
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
                    itemBuilder: (context,index)=>FavPlayerCard(
                      id: result[index].id,
                      name: result[index].name,
                      type: false,
                      isFollow: result[index].isFollow,
                      isFav: result[index].isFavourite,
                      avatar: result[index].avatar,
                      position: result[index].position,
                      number: result[index].clubShirtNumber,
                    ),
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
