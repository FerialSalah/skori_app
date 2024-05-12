import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/faliure.dart';
import '../../../domain/usecase/auth_usecase.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthUseCase authUseCase;
  OtpBloc(this.authUseCase) : super(OtpInitial()) {
    on<VerifyOtpEvent>((event, emit) => _otpEventHandler(event, emit));
  }


  _otpEventHandler(VerifyOtpEvent event, Emitter<OtpState> emit) async {
    emit(OtpLoading());
    final result = await authUseCase.OtpCall(
      phone: event.phone, code: event.code,otp: event.otp);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OtpOffline(
            "connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(OtpField(failure.msg));
      } else if (failure is FailureService) {
        emit(OtpField("Something wrong in Servicer , please try agin later"));
      }
    }, (response){

      emit(OtpSuccess("Success"));
    });
  }


}
