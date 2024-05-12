import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/favorites_event.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/team_favorites_bloc.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/empty.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/widgets/offline_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import 'fav_team_card.dart';

class FavoriteTeamsList extends StatefulWidget {
  const FavoriteTeamsList({Key? key}) : super(key: key);

  @override
  State<FavoriteTeamsList> createState() => _FavoriteTeamsListState();
}

class _FavoriteTeamsListState extends State<FavoriteTeamsList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<FavoritesTeamsBloc>(context)
          ..add(FavoritesTeamsPagination());
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
    return BlocBuilder<FavoritesTeamsBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<FavoritesTeamsBloc>(context).favoritesTeams;
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
                      isFollow: result[index].isFollow,
                      type: true,
                      isFav: result[index].isFavorites,
                      countryFlag: result[index].countryFlag,),
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
