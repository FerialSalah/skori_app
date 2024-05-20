import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/presentation/bloc/player_news_bloc.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../news/presentation/widgets/news_card.dart';
import '../bloc/team_news_bloc.dart';

class TeamNews extends StatelessWidget {

  const TeamNews({super.key,});



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


