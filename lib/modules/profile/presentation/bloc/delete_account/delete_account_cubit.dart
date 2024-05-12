import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/profile/data/model/my_packages_model.dart';
import 'package:skori/modules/profile/data/model/package_model.dart';
import '../../../../../core/app_storage/app_storage.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/network/network_checker.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/snack_bar.dart';


class DeleteAccountCubit extends Cubit<BaseState>{
  DeleteAccountCubit(this.networkChecker) : super(InitState());

  static DeleteAccountCubit of(context) => BlocProvider.of(context);

  NetworkChecker networkChecker;
  Dio dio = Dio();
  Future<void> deleteAccount() async {
    dio.options.headers.addAll({
      'Accept':"application/json",
      if(AppStorage.isLogged)
        'Authorization': 'Bearer ${AppStorage.getToken}',
    });
    if (await networkChecker.isDeviceConnected) {

      emit(LoadingState());
      try {
        final r = await dio.post("https://dev.azraqna.com/api/deleteAccount",);

        if(r.statusCode==200){
          AppStorage.signOut();
          emit(SuccessState());
        }else{
          print(r.statusCode);
          print("====================ccccccccc");
          emit(ErrorState(msg: ''));
        }
      } catch (e, s) {
        print("====================jjjjjj");
        print("====================$s");
        print("====================$e");
        emit(ErrorState(msg: ''));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }

}