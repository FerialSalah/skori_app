import 'package:bloc/bloc.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/modules/profile/domain/usecase/profile_usecase.dart';
import 'package:skori/modules/profile/presentation/bloc/change_password/state.dart';
import '../../../../../core/errors/faliure.dart';
import 'event.dart';



class ContactUsBloc extends Bloc<ContactUsEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  ContactUsBloc(this.profileUsaCase) : super(InitState()) {
    on<ContactUsCall>((event, emit) => _contactUsEventHandler(event, emit));
  }

  _contactUsEventHandler(ContactUsCall event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.contactUs(
      name: event.name,
      email: event.email,
      message: event.message,
        );
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
           msg:  "connection network unstable , please try agin after check connection", ));
      }  else if (failure is FailureServiceWithResponse) {
        emit(ErrorState( msg: failure.msg,));
      } else if (failure is FailureService) {
        emit(ErrorState(msg:"Something wrong in Service , please try again later"));
      }
    }, (response) => emit(DoneState(msg: "The feedback has been sent successfully")));
  }
}
