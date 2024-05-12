import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../network/urls_app.dart';
import 'country_model.dart';

class CountriesCubit extends Cubit<BaseState>{
  CountriesCubit() : super(InitState());

  static CountriesCubit of(context) => BlocProvider.of(context);

  CountriesModel? countriesModel ;


  Future<void> getCountries() async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(COUNTRIES_URL);
      print(r.data);
      countriesModel = CountriesModel.fromJson(r.data);

    }catch(e,s){
      print(s);
      showSnackBar(e.toString());
    }
    emit(InitState());

  }

}