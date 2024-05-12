import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../nav_bar/presentation/widgets/matches_card.dart';
import '../bloc/team_matches_bloc.dart';

class TeamMatches extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
    return BlocBuilder<TeamMatchesBloc, BaseState>(
      builder: (context, state) {
        final teamMatches = BlocProvider.of<TeamMatchesBloc>(context).teamMatches;
        if(state is LoadingState){
          return ColorLoader();
        }else if(state is SuccessState){
          return    ListView.separated(

            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
              itemCount: teamMatches.length,
              shrinkWrap: true,
             // physics: NeverScrollableScrollPhysics(),
              primary: false,
              separatorBuilder:(_,c)=>SizedBox(height: 10,),
              itemBuilder: (context,index){
                return MatchesCard(
                  isMatchScreen: false,
                  homeTeamId: teamMatches[index].homeTeamId,
                  awayTeamId: teamMatches[index].awayTeamId,
                  id: teamMatches[index].id,
                  homeTeamName: teamMatches[index].homeTeamName,
                  homeTeamScore: teamMatches[index].homeTeamScore,
                  homeTeamLogo: teamMatches[index].homeTeamLogo,
                  awayTeamName: teamMatches[index].awayTeamName,
                  awayTeamScore: teamMatches[index].awayTeamScore,
                  awayTeamLogo: teamMatches[index].awayTeamLogo,
                  logo: teamMatches[index].logo,
                  time: teamMatches[index].time,
                  date: teamMatches[index].date,
                  currentTime: teamMatches[index].currentTime,
                  title: teamMatches[index].season,
                  type: teamMatches[index].type,
                  watchLink: teamMatches[index].watchLink,
                  stadium: teamMatches[index].stadium,
                );
              });
        }else if(state is OfflineState){
          return OfflinePage();
        }else {
          return Text("Something Error");
        }

      },
    );

  }
}

