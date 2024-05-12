import 'package:bloc/bloc.dart';
import 'package:skori/modules/authentication/presentation/bloc/sign_up/state.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../domain/usecase/auth_usecase.dart';
import 'event.dart';



class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthUseCase authUseCase;
  SignUpBloc(this.authUseCase) : super(SignUpInitial()) {
    on<signUpCall>((event, emit) => _signUpEventHandler(event, emit));
  }

  _signUpEventHandler(signUpCall event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final result = await authUseCase.signUpCall(
        firstName: event.firstName, lastName: event.lastName,gender: event.gender??"",phone: event.phone??"",
        password: event.password,confirmPassword: event.confirmPassword,email: event.email,birthDate: event.birthDate??"");
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(SignUpOffline(
            "connection network unstable , please try agin after check connection"));
      }  else if(failure is FailureServiceValidation){
        emit(SignUpValidate(failure.errors));
      } else if (failure is FailureServiceWithResponse) {
        emit(SignUpField(failure.msg));
      } else if (failure is FailureService) {
        emit(SignUpField("Something wrong in Servicer , please try agin later"));
      }
    }, (response) => emit(SignUpSuccess()));
  }
}
