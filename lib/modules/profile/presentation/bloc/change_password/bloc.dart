import 'package:bloc/bloc.dart';
import 'package:skori/modules/profile/domain/usecase/profile_usecase.dart';
import 'package:skori/modules/profile/presentation/bloc/change_password/state.dart';
import '../../../../../core/errors/faliure.dart';
import 'event.dart';



class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ProfileUseCase profileUsaCase;
  ChangePasswordBloc(this.profileUsaCase) : super(ChangePasswordInitial()) {
    on<ChangePasswordCall>((event, emit) => _changePasswordEventHandler(event, emit));
  }

  _changePasswordEventHandler(ChangePasswordCall event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordLoading());
    final result = await profileUsaCase.changePassword(
        oldPassword: event.oldPassword,
        newPassword: event.newPassword,
        newPasswordConfirm:event.newPasswordConfirm );
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(ChangePasswordOffline(
            "connection network unstable , please try agin after check connection"));
      }  else if(failure is FailureServiceValidation){
        emit(ChangePasswordValidate(failure.errors));
      } else if (failure is FailureServiceWithResponse) {
        emit(ChangePasswordField(failure.msg));
      } else if (failure is FailureService) {
        emit(ChangePasswordField("Something wrong in Servicer , please try agin later"));
      }
    }, (response) => emit(ChangePasswordSuccess()));
  }
}
