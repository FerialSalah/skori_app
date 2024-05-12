import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/network/urls_app.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';

class AvailabilityCubit extends Cubit<BaseState>{
  AvailabilityCubit() : super(InitState());

  static AvailabilityCubit of(context) => BlocProvider.of(context);

  bool? availability;


  Future<void> getAvailability() async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(AVAILABILITY_URL);
      print(r.data);
      availability = r.data['data'];
      emit(SuccessState());
    }catch(e,s){
      print(s);
      showSnackBar(e.toString());
      emit(ErrorState(msg: "msg"));
    }


  }

}