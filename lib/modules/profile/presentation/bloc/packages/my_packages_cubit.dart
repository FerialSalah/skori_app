import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/profile/data/model/my_packages_model.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/network/network_checker.dart';
import '../../../../../core/state/base_state.dart';


class MyPackagesCubit extends Cubit<BaseState>{
  MyPackagesCubit(this.networkChecker) : super(InitState());

  static MyPackagesCubit of(context) => BlocProvider.of(context);

  MyPackageModel? myPackageModel = MyPackageModel() ;
  NetworkChecker networkChecker;

  Future<void> getMyPackages() async {
    if (await networkChecker.isDeviceConnected) {

      emit(LoadingState());
      try {
        final r = await DioHelper.get("${PACKAGES_URL}${SUBSCRIPTION_PACKAGES_URL}");
        if(r.statusCode==200){
          myPackageModel = MyPackageModel.fromJson(r.data);
          emit(SuccessState());
        }else{
          print("====================ccccccccc");
          emit(ErrorState(msg: ''));
        }
      } catch (e, s) {
        print("====================jjjjjj");
        emit(ErrorState(msg: ''));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }

}