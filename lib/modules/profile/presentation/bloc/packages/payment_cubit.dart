import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/routes/navigator_push.dart';
import '../../../../../core/dio_helper/dio_helper.dart';
import '../../../../../core/network/network_checker.dart';
import '../../../../../core/network/urls_app.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../../../webview_test.dart';
import '../../../data/model/payment_model.dart';


class PaymentCubit extends Cubit<BaseState> {
  PaymentCubit(this.networkChecker) : super(InitState());

  static PaymentCubit of(context) => BlocProvider.of(context);
  NetworkChecker networkChecker;

  PaymentModel? paymentModel ;

  Future<void> createCharge({required String amount,required String paymentType}) async {
    if (await networkChecker.isDeviceConnected) {
      emit(LoadingState());
      final body = {
        'amount': amount,
        'payment_type':paymentType,
      };
      try {
        final r = await DioHelper.post(PAYMENT_URL, body: body);
        if (r.statusCode == 200 || r.statusCode == 201) {
          paymentModel = PaymentModel.fromJson(r.data);
          print(r.data);

          emit(SuccessState());
        } else if (r.statusCode==422){
          showSnackBar(r.data['message']);
          emit(ErrorState(msg: ""));
        }else{
          emit(ErrorState(msg: ""));
        }
      } catch (e, s) {

        showSnackBar(e.toString());
        emit(ErrorState(msg: ''));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }
}
