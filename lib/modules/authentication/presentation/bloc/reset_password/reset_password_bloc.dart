import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/auth_usecase.dart';
import 'reset_password_event.dart';


class ResetPasswordBloc extends Bloc<ResetPasswordEvent, BaseState> {
  final AuthUseCase authUseCase;
  ResetPasswordBloc(this.authUseCase) : super(InitState()) {
    on<SendResetPasswordEvent>((event, emit) => _resetPasswordEventHandler(event, emit));
  }


  _resetPasswordEventHandler(SendResetPasswordEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await authUseCase.resetPassword(resetToken: event.resetToken,
    password: event.password,confirmPassword: event.confirmPassword);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg: "connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg:failure.msg));
      } else if(failure is FailureServiceValidation){
        emit(ValidateState(errors: failure.errors));
      } else if (failure is FailureService) {
        emit(ErrorState(msg:"Something wrong in Servicer , please try agin later"));
      }
    }, (response){

      emit(SuccessState());
    });
  }


}
