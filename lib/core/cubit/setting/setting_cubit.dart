import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/setting/setting_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../network/urls_app.dart';

class SettingCubit extends Cubit<BaseState>{
  SettingCubit() : super(InitState());

  static SettingCubit of(context) => BlocProvider.of(context);

  SettingModel? settingModel ;


  Future<void> getSetting() async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(SETTING_URL);
      settingModel = SettingModel.fromJson(r.data);
      print("Social========");
      print(r.data);

    }catch(e,s){
      print(s);
      showSnackBar(e.toString());
    }
    emit(InitState());

  }

}