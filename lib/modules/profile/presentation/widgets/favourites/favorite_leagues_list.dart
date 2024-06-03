import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/favorites_event.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/leagues_favourits_bloc.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/empty.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/widgets/offline_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import 'fav_leagues.dart';


class FavoritesLeaguesList extends StatefulWidget {
  FavoritesLeaguesList({Key? key,}) : super(key: key);

  @override
  State<FavoritesLeaguesList> createState() => _FavoritesLeaguesListState();
}

class _FavoritesLeaguesListState extends State<FavoritesLeaguesList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<FavoritesLeaguesBloc>(context)
          ..add(FavoritesLeaguesPagination());
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
    return BlocBuilder<FavoritesLeaguesBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<FavoritesLeaguesBloc>(context).favoritesLeagues;
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
                    itemBuilder: (context,index)=>FavLeagueCard(
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
