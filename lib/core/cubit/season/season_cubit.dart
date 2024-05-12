import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/season/season_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../network/urls_app.dart';

class SeasonsCubit extends Cubit<BaseState>{
  SeasonsCubit() : super(InitState());

  static SeasonsCubit of(context) => BlocProvider.of(context);

  SeasonModel? seasonModel ;


  Future<void> getSeasons() async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(SEASONS_URL);
      print("seasons : ${r.data}");
      seasonModel = SeasonModel.fromJson(r.data);

    }catch(e,s){
      print("errrrrrrrrrrrrrrrrrrrrrrrr");
      print(s);
      showSnackBar(e.toString());
    }
    emit(InitState());

  }

}