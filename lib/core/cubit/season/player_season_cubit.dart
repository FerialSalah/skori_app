import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/season/season_model.dart';
import 'package:skori/core/dio_helper/dio_helper.dart';

import '../../network/network_checker.dart';
import '../../network/urls_app.dart';
import '../../state/base_state.dart';
import '../../widgets/snack_bar.dart';

class PlayerSeasonsCubit extends Cubit<BaseState>{
  PlayerSeasonsCubit(this.networkChecker) : super(InitState());

  static PlayerSeasonsCubit of(context) => BlocProvider.of(context);

  SeasonModel? seasonModel ;

  NetworkChecker networkChecker;
  Future<void> getPlayerSeasons(int playerId) async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(SEASONS_URL+"/$playerId");
      print("player seasons : ${r.data}");
      seasonModel = SeasonModel.fromJson(r.data);

    }catch(e,s){
      print("errrrrrrrrrrrrrrrrrrrrrrrr");
      print(s);
      showSnackBar(e.toString());
    }
    emit(InitState());

  }


  // Future<void> toggleFavorite({required int id,required String type}) async {
  //   if (await networkChecker.isDeviceConnected) {
  //     emit(LoadingState());
  //     final body = {
  //       'model_id': id,
  //       'model_type': type};
  //     try {
  //       final r = await DioHelper.post(TOGGLE_FAVORITE, body: body);
  //       if (r.statusCode == 200 || r.statusCode == 201) {
  //         emit(SuccessState());
  //         BlocProvider.of<FavoritesTeamsBloc>(RouteManager.currentContext)..add(GetFavoritesTeamsData());
  //         BlocProvider.of<FavoritesPlayersBloc>(RouteManager.currentContext)..add(GetFavoritesPlayersData());
  //         BlocProvider.of<FavoritesLeaguesBloc>(RouteManager.currentContext)..add(GetFavoritesLeaguesData());
  //       } else {
  //         emit(ErrorState(msg: ""));
  //       }
  //     } catch (e, s) {
  //       print(s);
  //       showSnackBar(e.toString());
  //       emit(ErrorState(msg: ''));
  //     }
  //   } else {
  //     emit(OfflineState(msg: "check"));
  //   }
  // }

}