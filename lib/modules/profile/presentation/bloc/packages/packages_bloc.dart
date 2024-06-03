import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/network/urls_app.dart';
import 'package:skori/modules/profile/data/model/package_model.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/network/network_checker.dart';
import '../../../../../core/state/base_state.dart';


class PackagesCubit extends Cubit<BaseState>{
  PackagesCubit(this.networkChecker) : super(LoadingState());

  static PackagesCubit of(context) => BlocProvider.of(context);

  PackagesModel? packagesModel ;
  NetworkChecker networkChecker;

  Future<void> getPackages() async {
    if (await networkChecker.isDeviceConnected) {

      emit(LoadingState());
      try {
        final r = await DioHelper.get(PACKAGES_URL);

        if(r.statusCode==200){
          packagesModel = PackagesModel.fromJson(r.data);
          emit(SuccessState());
        }else{
          print("====================ccccccccc");
          emit(ErrorState(msg: ''));
        }
      } catch (e) {
        print("====================jjjjjj");
        emit(ErrorState(msg: ''));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }

}