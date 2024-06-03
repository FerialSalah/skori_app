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



}