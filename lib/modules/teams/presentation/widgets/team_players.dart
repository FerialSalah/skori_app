import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/teams/presentation/bloc/team_player_bloc.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../players/presentation/Widgets/player_card.dart';

class TeamPlayers extends StatefulWidget {
  final int teamId;

  const TeamPlayers({super.key, required this.teamId});


  @override
  State<TeamPlayers> createState() => _TeamPlayersState();
}

class _TeamPlayersState extends State<TeamPlayers> {

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    print("goooooooooo");
    // scrollController.addListener(() async {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     print("eeeeeeeeeeeeeeee");
    //     await BlocProvider.of<TeamPlayersBloc>(context)
    //       ..add(TeamPlayersPagination(id: widget.teamId));
    //   }
    // });
    super.initState();
  }
  @override
  void dispose() {

    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamPlayersBloc, BaseState>(
      builder: (context, state) {
        final teamPlayers = BlocProvider.of<TeamPlayersBloc>(context).teamPlayers;
        if(state is LoadingState){
          return ColorLoader();
        }else if(state is SuccessState|| state is PaginateState){
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    controller: scrollController,
                   // physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    padding: EdgeInsets.symmetric(vertical:15,horizontal: 15 ),
                    itemBuilder: (context,index)=>PlayerCard(
                      avatar: teamPlayers[index].avatar,
                      name: teamPlayers[index].name,
                      position: teamPlayers[index].position,
                      isFollow: teamPlayers[index].isFollow,
                      id: teamPlayers[index].id,
                      isFavorite: teamPlayers[index].isFavourite,
                      number: teamPlayers[index].clubShirtNumber,
                      clubLogo: teamPlayers[index].teamEntity!.logo,
                      clubName: teamPlayers[index].teamEntity!.name,
                    ),
                    separatorBuilder: (context,_)=>SizedBox(height:10.h,),
                    itemCount:teamPlayers.length),
              ),
              if(state is PaginateState)
                ColorLoader(),
              SizedBox(height: 50,),
            ],
          );

        }else if(state is OfflineState){
          return OfflinePage();
        }else {
          return Text("Something Error");
        }

      },
    );

  }
}
