import 'package:bloc/bloc.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../domain/usecase/auth_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;
  LoginBloc(this.authUseCase) : super(LoginInitial()) {
    on<LoginCall>((event, emit) => _loginEventHandler(event, emit));
  }

  _loginEventHandler(LoginCall event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await authUseCase.loginCall(
        email: event.email,password: event.password,firebaseId: event.firebaseId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(LoginOffline(
            "connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(LoginField(failure.msg));
      } else if (failure is FailureService) {
        emit(LoginField("Something wrong in Servicer , please try agin later"));
      }
    }, (response) => emit(LoginSuccess()));
  }
}
