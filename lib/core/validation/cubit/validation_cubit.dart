import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationCubit extends Cubit<bool> {
  static ValidationCubit of(context) => BlocProvider.of(context);
  ValidationCubit(super.initialState);


  bool isValidated = true;

  void checkValidationNumberShipment(String query) {
    if (query.trim().isEmpty) {
      isValidated = false;
      emit(isValidated);
    } else if (!query.startsWith("1")) {
      isValidated = false;
      emit(isValidated);
    } else if (query.length < 9) {
      isValidated = false;
      emit(isValidated);
    } else if (query.length > 14) {
      isValidated = true;
      emit(isValidated);
    } else {
      isValidated = true;
      emit(isValidated);
    }
  }

  void checkPhoneNumber() {
      isValidated = false;
      emit(isValidated);

  }

  void replaceStateWithInitState() {
    isValidated = true;
    emit(isValidated);
  }
}
