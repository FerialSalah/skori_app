import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../news/presentation/widgets/news_card.dart';
import '../bloc/team_event.dart';
import '../bloc/team_news_bloc.dart';

class TeamNews extends StatefulWidget {
  final int teamId;
  const TeamNews({super.key, required this.teamId,});

  @override
  State<TeamNews> createState() => _TeamNewsState();
}

class _TeamNewsState extends State<TeamNews> {
  @override
  void initState() {

    BlocProvider.of<TeamNewsBloc>(context)..add(GetTeamNews(id: widget.teamId));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.025,right: MediaQuery.of(context).size.width*.025,),
      child: BlocBuilder<TeamNewsBloc, BaseState>(
        builder: (context, state) {
          final teamNews = BlocProvider.of<TeamNewsBloc>(context).teamNews;
          if(state is LoadingState){
            return ColorLoader();
          }else if(state is SuccessState){
            return ListView.separated(
              // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 5),
                itemCount: teamNews.length,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                primary: false,
                separatorBuilder:(_,c)=>SizedBox(height: 15,),
                itemBuilder: (context,index){
                  return NewsCart(
                    newsEntity: teamNews[index],
                    isPlayer: false,
                    isTeam: true,
                  );
                });
          }else if(state is OfflineState){
            return OfflinePage();
          }else {
            return Text("Something Error");
          }

        },
      ),

    );
  }
}


