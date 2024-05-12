import 'package:bloc/bloc.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';
import 'edit_profile_event.dart';



class EditProfileBloc extends Bloc<EditProfileEvent, BaseState> {
  final ProfileUseCase profileUsaCase;EditProfileBloc(this.profileUsaCase) : super(InitState()) {

    on<EditProfileDate>((event, emit) => _handleEditProfileData(event, emit));

  }

  _handleEditProfileData(EditProfileDate event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.editProfile(
      firstName:event.firstName ,lastName:event.lastName ,phone:event.phone ,email: event.email,gender: event.gender
    );
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      emit(SuccessState(data: response));
    });
  }

}
