import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationShipmentInfo extends Cubit<bool> {
  bool isValidatedInfoShipment = false;
  ValidationShipmentInfo(super.initialState);
  void checkValidationInfoShipment(
      String? date, bool startedPlace, bool endPlace) {
    print(startedPlace);
    print(endPlace);
    if (date != null && startedPlace == true && endPlace == true) {
      isValidatedInfoShipment = true;
      emit(isValidatedInfoShipment);
    } else {
      isValidatedInfoShipment = false;
      emit(isValidatedInfoShipment);
    }
  }
}
