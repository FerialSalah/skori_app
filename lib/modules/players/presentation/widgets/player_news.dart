import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/presentation/bloc/player_news_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../news/presentation/widgets/news_card.dart';

class NewsOfPlayer extends StatefulWidget {
  final int id;

  const NewsOfPlayer({super.key, required this.id,});

  @override
  State<NewsOfPlayer> createState() => _NewsOfPlayerState();
}

class _NewsOfPlayerState extends State<NewsOfPlayer> {

  @override
  void initState() {
    BlocProvider.of<PlayerNewsBloc>(context)..add(GetPlayerNews(id: widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.025,right: MediaQuery.of(context).size.width*.025,),
      child: BlocBuilder<PlayerNewsBloc, BaseState>(
        builder: (context, state) {
          final playerNews = BlocProvider.of<PlayerNewsBloc>(context).playerNews;
          if(state is LoadingState){
            return ColorLoader();
          }else if(state is SuccessState){
            return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 5),
                itemCount: playerNews!.length,
                primary: false,
                separatorBuilder:(_,c)=>SizedBox(height: 15,),
                itemBuilder: (context,index){
                  return NewsCart(
                    newsEntity: playerNews[index],
                    isPlayer: true,
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


