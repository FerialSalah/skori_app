import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/player_league/player_league_model.dart';
import 'package:skori/core/cubit/season/season_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../network/urls_app.dart';

class PlayerLeaguesCubit extends Cubit<BaseState>{
  PlayerLeaguesCubit() : super(InitState());

  static PlayerLeaguesCubit of(context) => BlocProvider.of(context);

  PlayerLeagueModel? playerLeagueModel ;


  Future<void> getPlayerLeagues(int playerId) async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(PLAYER_LEAGUES_URL+"$playerId");
      print("player leagues : ${r.data}");
      playerLeagueModel = PlayerLeagueModel.fromJson(r.data);
     print(playerLeagueModel!.data);
    }catch(e,s){
      print("errrrrrrrrrrrrrrrrrrrrrrrr");
      print(s);
      showSnackBar(e.toString());
    }
    emit(InitState());

  }

}