import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/nav_bar/presentation/screens/nav_bar.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/network/network_checker.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../data/model/user_model.dart';


class SocialLoginCubit extends Cubit<BaseState>{
  SocialLoginCubit(this.networkChecker) : super(InitState());

  static SocialLoginCubit of(context) => BlocProvider.of(context);

  NetworkChecker networkChecker;

  Future<void> googleSocialLogin( String token) async {
    if (await networkChecker.isDeviceConnected) {

      emit(LoadingState());
      try {
        final response = await DioHelper.post("/auth/login/google/callback",body: {
          "access_provider_token":token,
          "context":"mobile"
        });
        if(response.statusCode==200){
          UserModel userModel= UserModel.fromJson(response.data['data']);
          AppStorage.cacheUser(userModel);
          AppStorage.cacheToken(response.data['token']);
          emit(SuccessState());
          RouteManager.navigateAndPopAll(NavBarScreen());
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

  Future<void> appleSocialLogin( String token) async {
    if (await networkChecker.isDeviceConnected) {

      emit(LoadingState());
      try {
        final response = await DioHelper.post("/auth/login/apple/callback",body: {
          "access_provider_token":token
        });
        if(response.statusCode==200){
          UserModel userModel= UserModel.fromJson(response.data['data']);
          AppStorage.cacheUser(userModel);
          AppStorage.cacheToken(response.data['token']);
          emit(SuccessState());
          RouteManager.navigateAndPopAll(NavBarScreen());
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