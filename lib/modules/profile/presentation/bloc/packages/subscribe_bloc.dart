
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/webview_test.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/network/network_checker.dart';
import '../../../../../core/network/urls_app.dart';
import '../../../../../core/routes/navigator_push.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/snack_bar.dart';


class SubscribeCubit extends Cubit<BaseState> {
  SubscribeCubit(this.networkChecker) : super(InitState());

  static SubscribeCubit of(context) => BlocProvider.of(context);
  NetworkChecker networkChecker;
   int? packageId;
  Future<void> subscribe() async {
    if (await networkChecker.isDeviceConnected) {
      emit(LoadingState());
      final body = {
        'package_id': packageId,
        //"charge_id":chargeId
        "device":"mobile"
      };
      print(body);
      try {
        final r = await DioHelper.post(SUBSCRIBE_URL, body: body);
        if (r.statusCode == 200 || r.statusCode == 201) {
          print("===================");
          print("url is :${r.data['url']}");
         // RouteManager.navigateAndPopUntilFirstPage(PackagesScreen());
         RouteManager.navigateTo(WebViewExample(url: r.data['url'] ,));

          emit(SuccessState());
        } else if (r.statusCode==422){
          print(r.data);
          showSnackBar(LocaleKeys.alreadySubscribe.tr());
          emit(ErrorState(msg: ""));
        }else{
          emit(ErrorState(msg: ""));
        }
      } catch (e) {
       print(e.toString());
       showSnackBar(e.toString());
        emit(ErrorState(msg: ''));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }
}
